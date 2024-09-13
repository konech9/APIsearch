from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
from django.utils import timezone



class UserManager(BaseUserManager):
    def create_user(self, username, password=None, **extra_fields):
        if not username:
            raise ValueError('The Username field must be set')
        user = self.model(username=username, **extra_fields)
        user.set_password(password)  # Автоматически шифрует пароль
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        return self.create_user(username, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=128)
    role = models.CharField(max_length=12)
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    patronymic = models.CharField(max_length=20, blank=True, null=True)
    age = models.IntegerField()
    birth_date = models.DateField()
    phone = models.CharField(max_length=11)
    created_at = models.DateField(auto_now_add=True)
    last_login = models.DateTimeField(null=True, blank=True)
    date_joined = models.DateTimeField(default=timezone.now)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    objects = UserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['first_name', 'last_name', 'role']

    def __str__(self):
        return self.username


class API(models.Model):
    # id создается автоматически в Django как primary key
    creator = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    name = models.CharField(max_length=30, blank=True, null=True)
    type = models.CharField(max_length=30, blank=True, null=True)
    protocol = models.CharField(max_length=10, blank=True, null=True)
    body = models.TextField(blank=True, null=True)
    created_at = models.DateField(blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    count_of_uses = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name