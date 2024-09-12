from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import User

class UserRegisterForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'patronymic', 'age', 'birth_date', 'phone', 'password1', 'password2']

        def save(self, commit=True):
            # Call save of the super of your own class,
            # which is UserCreationForm.save() which calls user.set_password()
            user = super(UserCreationForm, self).save(commit=False)
            user.set_password(self.cleaned_data['password1'])

            # Add the things your super doesn't do for you
            #user.email = self.cleaned_data['email']
            # user.first_name = self.cleaned_data['first_name']
            # user.last_name = self.cleaned_data['last_name']

            if commit:
                user.save()

            return user

class UserLoginForm(AuthenticationForm):
    print("Hello")
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))

    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    print(f"'{password}'")
