from django.apps import AppConfig
from django.conf import settings
from django.db.models.signals import post_migrate


def define_permission_groups(sender, **kwargs):
    from django.contrib.auth.models import Group

    if not Group.objects.filter(name='company').exists():
        Group.objects.create(name='company')        

    if not Group.objects.filter(name='jobseeker').exists():
        Group.objects.create(name='jobseeker')   


class MyappConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'myapp'

    def ready(self):       
        post_migrate.connect(define_permission_groups, sender=self)
        