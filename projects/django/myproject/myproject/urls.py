from django.contrib import admin
from django.urls import path, include
from rest_framework import permissions
# from drf_yasg.views import get_schema_view
# from drf_yasg import openapi
from rest_framework_simplejwt.views import *
from django.conf import settings
from django.conf.urls.static import static


# schema_view = get_schema_view(
#     openapi.Info(
#         title="www.e00049.com api endpoints",
#         default_version="v1",
#         description="JobSeekers API Endpoints",
#         terms_of_service="https://www.e00049.com/terms/",
#         contact=openapi.Contact(email="contact@e00049.com"),
#         license=openapi.License(name="MIT License"),
#     ),
#     public=True,
#     permission_classes=(permissions.AllowAny,),
# )

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/', include('myapp.urls')),
    # path('', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    # path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),    
] 
