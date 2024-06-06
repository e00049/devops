from django.conf import settings
from django.utils import timezone
from datetime import datetime
from django.http import JsonResponse
# from itertools import chain
from myapp.models import *
from myapp.serializers import *
from myapp.permissions import *
from django.core import signing
from django.shortcuts import render, redirect
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.auth.hashers import make_password
from django.http import HttpResponsePermanentRedirect
from django.http import HttpResponse
# from django.db.models import Q
# from django.http import Http404
from django.template.loader import get_template
from django.utils.encoding import DjangoUnicodeDecodeError, smart_str, force_str, smart_bytes
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from rest_framework.generics import ListCreateAPIView
from rest_framework.views import APIView
from rest_framework.exceptions import ValidationError
from rest_framework import generics, status, views, permissions, viewsets, filters
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response
from rest_framework.generics import RetrieveUpdateAPIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.authentication import TokenAuthentication
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from django.views.decorators.csrf import csrf_exempt
from rest_framework.permissions import IsAuthenticated 
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail, Cc, Attachment, FileContent, FileName, FileType, Disposition
# from drf_yasg import openapi
# from drf_yasg.utils import swagger_auto_schema
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.urls import reverse
from django.http import HttpResponsePermanentRedirect
from django.core.mail import EmailMessage
from django.contrib.auth.models import Group
from django.contrib.auth.hashers import make_password
from django.core.paginator import Paginator
from rest_framework.pagination import PageNumberPagination
from rest_framework.pagination import LimitOffsetPagination
# import requests, json, os, sys, time, jwt, random, phonenumbers, django_filters, boto3
import requests, json, os, sys, time, jwt, random
from django.shortcuts import get_object_or_404
from rest_framework.viewsets import ModelViewSet
from django.core.serializers import serialize
# from operator import itemgetter
from django.core.files.base import ContentFile
from rest_framework.authtoken.models import Token


def healthz(request):
    return JsonResponse({'status': 'ok'})


# Class beased APIs are started from here...
class UserRegistrationAPIView(generics.GenericAPIView): 
    serializer_class = UserRegistrationSerializer    

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        user_data = serializer.data
        return Response(user_data, status=status.HTTP_201_CREATED)


class UserLoginAPIView(generics.GenericAPIView):  # Normal-User-Login-API
    serializer_class = UserLoginSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
 
        return Response(serializer.data, status=status.HTTP_200_OK) 


class SkillsDetailsList(APIView):

    def get(self, request):

        skills_details = SkillsDetails.objects.all()
        serializer = SkillsDetailsSerializer(skills_details, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

        