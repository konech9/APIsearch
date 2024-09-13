from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import User
from django.core.exceptions import ValidationError


class UserRegisterForm(UserCreationForm):
    birth_date = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    phone = forms.CharField(required=True)
    age = forms.IntegerField(required=True)
    patronymic = forms.CharField(required=True)

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'patronymic', 'age', 'birth_date', 'phone', 'password1',
                  'password2']

    def clean_age(self):
        age = self.cleaned_data.get('age')
        if age < 0:
            raise ValidationError("Возраст должен быть больше 18 лет.")
        return age

    def clean_phone(self):
        phone = self.cleaned_data.get('phone')
        if not phone.isdigit():
            raise ValidationError("Телефон должен содержать только цифры.")
        if len(phone) < 0:
            raise ValidationError("Телефон должен содержать 10 цифр.")
        return phone

    def save(self, commit=True):
        # Получаем объект пользователя без сохранения в базу данных
        user = super(UserRegisterForm, self).save(commit=False)

        # Задаём дополнительные поля
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.patronymic = self.cleaned_data['patronymic']

        # Дополнительные атрибуты, которые не входят в модель User
        user.birth_date = self.cleaned_data['birth_date']
        user.phone = self.cleaned_data['phone']
        user.age = self.cleaned_data['age']

        # Хэшируем пароль
        user.set_password(self.cleaned_data['password1'])

        # Сохраняем пользователя в базе данных
        if commit:
            user.save()

        return user

class UserLoginForm(AuthenticationForm):
    #print("Hello")
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))

    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    #print(f"'{password}'")
