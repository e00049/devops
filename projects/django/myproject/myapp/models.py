from django.db import models
from django.conf import settings
from django.utils import timezone
from jsonfield import JSONField
from django.contrib.auth.models import Group
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from rest_framework.authtoken.models import Token


AUTH_PROVIDERS = {'facebook': 'facebook', 'google': 'google', 'twitter': 'twitter', 'email': 'email'}

class UserManager(BaseUserManager):
    def create_user(self, username, email, password=None, **extra_fields):
        if username is None:
            raise TypeError('Users should have a Username')
        if email is None:
            raise TypeError('Users should have an Email')

        user = self.model(username=username, email=self.normalize_email(email), **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, username, email, password=None, **extra_fields):
        if password is None:
            raise TypeError('Password should not be None')

        user = self.create_user(username, email, password, **extra_fields)
        user.is_superuser = True
        user.is_staff = True
        user.save()
        return user


class User(AbstractBaseUser, PermissionsMixin):
    # userModelPKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='userModelPKID')
    userCreatedDate = models.DateTimeField(auto_now_add=True)
    userUpdatedDate = models.DateTimeField(auto_now=True)    
    username      = models.CharField(max_length=255, db_index=True)
    email         = models.EmailField(max_length=255, unique=True, db_index=True)
    mobile_number = models.CharField(max_length=20, unique=True, blank=True, null=True) 
    is_verified   = models.BooleanField(default=False)
    is_verified_tc = models.BooleanField(default=False)
    is_verified_mobile = models.BooleanField(default=False)
    is_active   = models.BooleanField(default=True)
    is_staff    = models.BooleanField(default=False)
    otp         = models.CharField(max_length=6, null=True, blank=True)
    group       = models.ForeignKey(Group, on_delete=models.CASCADE, null=True, blank=True, editable=False, related_name='uniquegroup')
    created_by  = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True, blank=True, editable=False)
    auth_provider = models.CharField(max_length=255, blank=False, null=False, default=AUTH_PROVIDERS.get('email'))
    
    
    USERNAME_FIELD  = 'email'
    REQUIRED_FIELDS = ['username']

    objects = UserManager()

    def __str__(self):
        x = '%s : %s : %s : %s' % (self.id, self.username, self.email, self.group)
        return x

    def tokens(self):
        refresh = RefreshToken.for_user(self)

        return {
            'refresh': str(refresh),
            'access': str(refresh.access_token)
        }


class JobSeekerProfile(models.Model):
    jobSeekerProfilePKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='jobSeekerProfilePKID')
    userModelPKID = models.CharField(max_length=255, null=True, blank=True)        
    salutation   = models.CharField(max_length=20, null=True, blank=True)
    firstName    = models.CharField(max_length=100, null=True, blank=True)
    lastName     = models.CharField(max_length=100, null=True, blank=True)
    totalExperience  = models.CharField(max_length=20, null=True, blank=True)
    trainingExp = models.CharField(max_length=20, null=True, blank=True)
    mobileNumber = models.CharField(max_length=20, null=True, blank=True)
    email        = models.EmailField(max_length=254, null=True, blank=True)
    location     = models.CharField(max_length=100, null=True, blank=True)
    currentLocationCountry  = models.CharField(max_length=100, null=True, blank=True)
    currentLocationState  = models.CharField(max_length=100, null=True, blank=True)    
    profilePictureName = models.CharField(max_length=1000, null=True, blank=True)
    uploadedResumeName = models.CharField(max_length=1000, null=True, blank=True)
    S3BucketURL  = models.CharField(max_length=255, null=True, blank=True ) # Image field    
    travelWithInYourCountry = models.CharField(max_length=25, null=True, blank=True)
    travelOutSideCountry   = models.CharField(max_length=25, null=True, blank=True)
    workingTimeZone   = models.CharField(max_length=2000, null=True, blank=True)
    skills  = models.CharField(max_length=2000, null=True, blank=True)
    socialMedia          = JSONField(blank=True, null=True) 
    profileCompleteScore = models.CharField(max_length=20, null=True, blank=True)
    jobSeekerProfileCreatedDate = models.DateTimeField(auto_now_add=True)  
    jobSeekerProfileUpdatedDate = models.DateTimeField(auto_now=True)     
    status       = models.CharField(max_length=100, null=True)

    class Meta:
        db_table = "JobSeekerProfile"

    def __str__(self):
        x = '%s : %s : %s : %s' % (self.jobSeekerProfilePKID, self.userModelPKID, self.firstName, self.status)
        return x
		

class PersonalDetail(models.Model):
    personalDetailPKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='personalDetailPKID')
    userModelPKID   = models.CharField(max_length=255, null=True, blank=True)
    dob                = models.CharField(max_length=255, null=True, blank=True)
    gender             = models.CharField(max_length=255, null=True, blank=True)
    martialStatus      = models.CharField(max_length=255, null=True, blank=True)
    secSalutation      = models.CharField(max_length=255, null=True, blank=True)
    secFirstName       = models.CharField(max_length=255, null=True, blank=True)
    secLastName        = models.CharField(max_length=255, null=True, blank=True)
    secContactCountryCode = models.CharField(max_length=255, null=True, blank=True)
    secondaryNumber  = models.CharField(max_length=255, null=True, blank=True)
    emgSalutation    = models.CharField(max_length=255, null=True, blank=True)
    emgFirstName     = models.CharField(max_length=255, null=True, blank=True)
    emgLastName      = models.CharField(max_length=255, null=True, blank=True)
    emgContactCountryCode = models.CharField(max_length=255, null=True, blank=True)
    emergencyNumber       = models.CharField(max_length=255, null=True, blank=True)
    aadharNumber          = models.CharField(max_length=255, null=True, blank=True)
    panNumber             = models.CharField(max_length=255, null=True, blank=True)
    passportNumber        = JSONField(blank=True, null=True)
    address         = JSONField(blank=True, null=True)
    languages       = JSONField(blank=True, null=True)
    visa            = models.CharField(max_length=255, null=True, blank=True)
    visaInfo        = JSONField(blank=True, null=True)
    differentlyAbled = models.CharField(max_length=255, null=True, blank=True)
    personalDetailCreatedData = models.DateTimeField(auto_now_add=True)
    personalDetailUpdatedData = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "PersonalDetail"

    def __str__(self):
        x = '%s : %s : %s' % (self.personalDetailPKID, self.userModelPKID, self.emgFirstName)
        return x


class WorkExperience(models.Model):
    workExperiencePKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')
    userModelPKID = models.CharField(max_length=255, null=True, blank=True)
    companyName = models.CharField(max_length=255, null=True, blank=True)
    designation = models.CharField(max_length=255, null=True, blank=True)
    technology = models.CharField(max_length=255, null=True, blank=True)
    employmentType = models.CharField(max_length=255, null=True, blank=True)
    dateOfJoining = models.CharField(max_length=255, null=True, blank=True)
    dateOfLeaving = models.CharField(max_length=255, null=True, blank=True)
    jobProfile = models.CharField(max_length=255, null=True, blank=True)
    workExperienceCreatedDate = models.DateTimeField(auto_now_add=True)  
    workExperienceUpdatedDate = models.DateTimeField(auto_now=True) 

    class Meta:
        db_table = "WorkExperience"

    def __str__(self):
        x = '%s : %s ' % (self.workExperiencePKID, self.userModelPKID )
        return x


class TrainingExperience(models.Model):
    trainingExperiencePKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='trainingExperiencePKID')
    userModelPKID = models.CharField(max_length=255, null=True, blank=True)
    profileName      = models.CharField(max_length=255, null=True, blank=True)
    trainingTechnology = models.CharField(max_length=255, null=True, blank=True)
    clientDelivered    = models.CharField(max_length=255, null=True, blank=True)
    trainingDuration   = models.CharField(max_length=255, null=True, blank=True)
    totalNoOfTrainings = models.CharField(max_length=255, null=True, blank=True)
    dateOfLastTraining = models.CharField(max_length=255, null=True, blank=True)
    totalTrainingExperience = models.CharField(max_length=255, null=True, blank=True)
    deliveryMethod = models.CharField(max_length=255, null=True, blank=True)
    demoLink       = models.CharField(max_length=255, null=True, blank=True)
    uploadedFeedbackName  = models.CharField(max_length=1000, null=True, blank=True)
    uploadedTocName  = models.CharField(max_length=1000, null=True, blank=True)
    projectTitle   = models.CharField(max_length=255, null=True, blank=True)
    projectDescription = models.CharField(max_length=255, null=True, blank=True)
    selectedCommercialsCurrency = models.CharField(max_length=255, null=True, blank=True)
    commercialsCurrency = models.CharField(max_length=255, null=True, blank=True)
    forLessThan4hrs = models.CharField(max_length=255, null=True, blank=True)
    for4hrs = models.CharField(max_length=255, null=True, blank=True)
    for8hrs = models.CharField(max_length=255, null=True, blank=True)
    trainingExperienceCreatedDate = models.DateTimeField(auto_now_add=True)
    trainingExperienceUpdatedDate = models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table = "TrainingExperience"

    def __str__(self):
        x = '%s : %s ' % (self.trainingExperiencePKID, self.userModelPKID )
        return x


class EducationDetail(models.Model):
    educationDetailPKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='educationDetailPKID')
    userModelPKID    = models.CharField(max_length=255, null=True, blank=True)
    education  = models.CharField(max_length=255, null=True, blank=True)
    university = models.CharField(max_length=255, null=True, blank=True)
    course     = models.CharField(max_length=255, null=True, blank=True)
    specialization = models.CharField(max_length=255, null=True, blank=True)
    mark = models.CharField(max_length=255, null=True, blank=True)
    modeOfLearning = models.CharField(max_length=255, null=True, blank=True)
    fromYear = models.CharField(max_length=255, null=True, blank=True)
    toYear   = models.CharField(max_length=255, null=True, blank=True)
    educationDetailCreatedDate = models.DateTimeField(auto_now_add=True)
    educationDetailUpdatedDate = models.DateTimeField(auto_now=True) 
		
    class Meta:
        db_table = "EducationDetail"

    def __str__(self):
        x = '%s : %s ' % (self.educationDetailPKID, self.userModelPKID )
        return x
		

class CertificationsDetail(models.Model):
    certificationsDetailPKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='certificationsDetailPKID')
    userModelPKID  = models.CharField(max_length=255, null=True, blank=True)
    technology 		  = models.CharField(max_length=255, null=True, blank=True)
    certificationName = models.CharField(max_length=255, null=True, blank=True)
    certificationId   = models.CharField(max_length=255, null=True, blank=True)
    url = models.CharField(max_length=255, null=True, blank=True)
    uploadedCertificateName = models.CharField(max_length=1000, null=True, blank=True)
    certificateNeverExpires = models.CharField(max_length=255, null=True, blank=True)
    certificationFromYear   = models.CharField(max_length=255, null=True, blank=True)
    certificationToYear     = models.CharField(max_length=255, null=True, blank=True)
    certificationsDetailCreatedDate = models.DateTimeField(auto_now_add=True)
    certificationsDetailUpdatedDate = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "CertificationsDetail"

    def __str__(self):
        x = '%s : %s ' % (self.certificationsDetailPKID, self.userModelPKID )
        return x


class WorkSample(models.Model):
    workSamplePKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='workSamplePKID')
    userModelPKID  = models.CharField(max_length=255, null=True, blank=True)
    title 		= models.CharField(max_length=255, null=True, blank=True)
    description = models.CharField(max_length=2550, null=True, blank=True)
    workUrl     = models.CharField(max_length=2550, null=True, blank=True)
    uploadedWorkSampleName = models.CharField(max_length=1000, null=True, blank=True)
    workSampleCreatedDate = models.DateTimeField(auto_now_add=True)
    workSampleUpdatedDate = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "WorkSample"

    def __str__(self):
        x = '%s : %s ' % (self.workSamplePKID, self.userModelPKID )
        return x


class ProfileScoreDetail(models.Model):
    ProfileScoreDetailPKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='statusFlowPKID')
    sectionDescription = models.CharField(max_length=200, null=True, blank=True)
    score = models.CharField(max_length=5, null=True, blank=True)
    
    class Meta:
        db_table = "ProfileScoreDetail"

    def __str__(self):
        x = '%s : %s' % (self.ProfileScoreDetailPKID, self.sectionDescription)
        return x


class ImageTable(models.Model):
    imageTablePKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='imageTablePKID')
    imageName   = models.CharField(max_length=255, null=True, blank=True)
    imageURL    = models.CharField(max_length=255, null=True, blank=True)
    imageStatus      = models.CharField(max_length=255, null=True, blank=True)
    imageDescription = models.CharField(max_length=255, null=True, blank=True)
 
    class Meta:
        db_table = "ImageTable"

    def __str__(self):
        x = '%s : %s : %s' % (self.imageTablePKID, self.imageName, self.imageDescription )
        return x	


class SkillsDetails(models.Model):
    skillsDetailsPKID = models.BigAutoField(auto_created=True, primary_key=True, serialize=True, verbose_name='skillsDetailsPKID')
    skillName = models.CharField(max_length=2000, null=True, blank=True)
    skillStatus = models.CharField(max_length=20, null=True, blank=True)
    skillsDetailsCreatedDate = models.DateTimeField(auto_now_add=True)
    skillsDetailsUpdatedDate = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "SkillsDetails"

    def __str__(self):
        x = '%s : %s ' % (self.skillsDetailsPKID, self.skillName)
        return x
