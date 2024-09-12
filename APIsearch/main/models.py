from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
from django.utils import timezone

# class User(models.Model):
#     username = models.CharField(max_length=50, unique=True)
#     password = models.CharField(max_length=18)  # В реальном проекте лучше использовать встроенную систему шифрования паролей
#     role = models.CharField(max_length=12)
#     first_name = models.CharField(max_length=20)
#     last_name = models.CharField(max_length=20)
#     patronymic = models.CharField(max_length=20, blank=True, null=True)  # Отчество может быть необязательным
#     age = models.IntegerField()
#     birth_date = models.DateField()
#     phone = models.CharField(max_length=11)
#     created_at = models.DateTimeField(auto_now_add=True)  # Время создания записи
#
#     def __str__(self):
#         return self.username


class CustomUserManager(BaseUserManager):
    def create_user(self, username, password=None, **extra_fields):
        if not username:
            raise ValueError('The Username must be set')
        user = self.model(username=username, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        return self.create_user(username, password, **extra_fields)

class CustomUser(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(max_length=255, unique=True)
    role = models.CharField(max_length=50, choices=[('admin', 'Admin'), ('user', 'User')], default='user')
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    patronomic = models.CharField(max_length=50, blank=True, null=True)
    age = models.IntegerField(blank=True, null=True)
    birth_date = models.DateField(blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['first_name', 'last_name']

    objects = CustomUserManager()

    def __str__(self):
        return self.username

class API(models.Model):
    # id создается автоматически в Django как primary key
    creator = models.ForeignKey(CustomUser, on_delete=models.CASCADE, default=1)
    name = models.CharField(max_length=30, blank=True, null=True)
    type = models.CharField(max_length=30, blank=True, null=True)
    protocol = models.CharField(max_length=10, blank=True, null=True)
    body = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    count_of_uses = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name