
from rest_framework_simplejwt.views import *
from django.urls import path
from myapp.views import *
from . import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('healthz/', healthz, name='healthz'),  # Health check endpoint
    path('user-registration-create/', UserRegistrationAPIView.as_view(), name="user-registration-create"),
    path('user-login-create/', UserLoginAPIView.as_view(), name="user-login-create"),
    path('skills-details-list/', SkillsDetailsList.as_view(), name='skills-details-list'),
] 
