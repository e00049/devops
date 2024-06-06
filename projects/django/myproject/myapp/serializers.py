import os
from django.contrib import auth
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from myapp.models import *
from myapp.views import *
from django.conf import settings
from django.core import signing
from rest_framework import serializers
from rest_framework.exceptions import AuthenticationFailed
from rest_framework_simplejwt.tokens import RefreshToken, TokenError
from rest_framework.authtoken.models import Token
from django.utils.encoding import smart_str, force_str, smart_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
# from myapp.register import register_social_user              


class UserRegistrationSerializer(serializers.ModelSerializer):  # Register-Serializer
    password = serializers.CharField(max_length=68, min_length=6, write_only=True, required=True, style={'input_type': 'password'})

    default_error_messages = {'username': 'The username should only contain alphanumeric characters'}

    class Meta:
        model = User
        fields = ['email', 'username', 'password', 'groups']

    def create(self, validated_data):
        groups_data = validated_data.pop('groups', [])
        user = User.objects.create_user(**validated_data)
        Token.objects.create(user=user)

        if groups_data:
            for group_name in groups_data:
                try:
                    group = Group.objects.get(name=group_name)
                    user.groups.add(group)
                except Group.DoesNotExist:
                    pass

        return user

    def validate(self, attrs):
        email    = attrs.get('email', '')
        username = attrs.get('username', '')

        if not username.isalnum():
            raise serializers.ValidationError(self.default_error_messages)
        return attrs


class UserLoginSerializer(serializers.ModelSerializer):  # Login-Serializer
    email    = serializers.EmailField(max_length=255, min_length=3)       
    username = serializers.CharField(max_length=255, min_length=3, read_only=True)
    password = serializers.CharField(max_length=68, min_length=6, write_only=True)    

    tokens = serializers.SerializerMethodField()

    def get_tokens(self, obj):
        user = User.objects.get(email=obj['email'])
        return {
            'refresh': user.tokens()['refresh'],
            'access': user.tokens()['access'],
        }

    class Meta:
        model = User
        fields = ['id', 'email', 'username', 'password', 'tokens', 'is_verified', 'is_verified_mobile', 'is_verified_tc', 'groups' ]

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        Token.objects.create(user=user)
        return user

    def validate(self, attrs):
        email    = attrs.get('email', '')
        password = attrs.get('password', '')
        filtered_user_by_email = User.objects.filter(email=email)
        user     = auth.authenticate(email=email, password=password)

        if filtered_user_by_email.exists() and filtered_user_by_email[0].auth_provider != 'email':
            raise AuthenticationFailed(
                detail='You are already registered with ' + filtered_user_by_email[0].auth_provider + ', please use ' + filtered_user_by_email[0].auth_provider + ' authentication')             

        if not user:
            raise AuthenticationFailed('Invalid credentials, try again')
        if not user.is_active:
            raise AuthenticationFailed('Account disabled, contact admin')
        if not user.is_verified:
            raise AuthenticationFailed('Email is not verified')

        return { 'id': user.id, 'username': user.username, 'email': user.email,  'tokens': user.tokens,  'is_verified': user.is_verified, 'is_verified_tc': user.is_verified_tc, 'is_verified_mobile' : user.is_verified_mobile, 'groups' : user.groups.all() }

        return super().validate(attrs)


class SkillsDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = SkillsDetails
        fields = '__all__'        
        