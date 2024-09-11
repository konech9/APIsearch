from django.db import models

class API(models.Model):
    name = models.CharField(max_length=255)  # Название API
    description = models.TextField()  # Описание
    price = models.DecimalField(max_digits=10, decimal_places=2)  # Цена
    category = models.CharField(max_length=100)  # Категория
    available = models.BooleanField(default=True)  # Доступно ли API

    def __str__(self):
        return self.name