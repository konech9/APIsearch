from django.shortcuts import render, redirect
from .models import API
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm, UserLoginForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import messages

def api_list(request):
    # Фильтры
    #category = request.GET.get('category')
    apis = API.objects.all()

    # if category:
    #     apis = apis.filter(category=category)

    context = {
        'apis': apis,
    }
    return render(request, 'api_list.html', context)


def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('profile')
    else:
        form = UserRegisterForm()
    return render(request, 'register.html', {'form': form})


# def login_view(request):
#     print("login")
#     if request.method == 'POST':
#         print(request)
#         form = UserLoginForm(request, data=request.POST)
#         # print(f"'{form.username}'")
#         # print(f"'{form.password}'")
#         if form.is_valid():
#             username = form.cleaned_data.get('username')
#             password = form.cleaned_data.get('password')
#             user = authenticate(username=username, password=password)
#             if user is not None:
#                 login(request, user)
#                 return redirect('profile')
#             else:
#                 print('User is none')
#         else:
#             print('Form not valid')
#     else:
#         form = UserLoginForm()
#         print('Not post')
#     return render(request, 'login.html', {'form': form})


def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        #print(f"'{form.username}'")
        #print(f"'{form.password}'")
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('profile')  # Перенаправление на профиль после входа
        else:
            print('Form not valid')
    else:
        form = AuthenticationForm()
    return render(request, 'login.html', {'form': form})


@login_required
def profile(request):
    return render(request, 'profile.html')

def logout_view(request):
    logout(request)
    return redirect('login')