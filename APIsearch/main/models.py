from django.db import models

class User(models.Model):
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=18)  # В реальном проекте лучше использовать встроенную систему шифрования паролей
    role = models.CharField(max_length=12)
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    patronymic = models.CharField(max_length=20, blank=True, null=True)  # Отчество может быть необязательным
    age = models.IntegerField()
    birth_date = models.DateField()
    phone = models.CharField(max_length=11)
    created_at = models.DateTimeField(auto_now_add=True)  # Время создания записи

    def __str__(self):
        return self.username

class API(models.Model):
    # id создается автоматически в Django как primary key
    creator = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    name = models.CharField(max_length=30, blank=True, null=True)
    type = models.CharField(max_length=30, blank=True, null=True)
    protocol = models.CharField(max_length=10, blank=True, null=True)
    body = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    count_of_uses = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name