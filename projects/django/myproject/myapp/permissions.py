from rest_framework.permissions import BasePermission
from django.contrib.auth.models import Group


class IsSuperUser(BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_superuser    


class IsCompanyUser(BasePermission):   
    def has_permission(self, request, view):
        current_user = request.user
        user_id = current_user.id
        user_groups = current_user.groups.all()

        for group in user_groups:
            if group.name == "company":
                return True
        return False


class IsJobSeekerUser(BasePermission):
    def has_permission(self, request, view):
        current_user = request.user
        user_id = current_user.id
        user_groups = current_user.groups.all()

        for group in user_groups:
            if group.name == "jobseeker":
                return True
        return False

