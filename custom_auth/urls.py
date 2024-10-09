from django.urls import path
from .views import (
    register,
    login,
    forget_password,
    logout,
    reset_password,
    set_new_password,
    get_programs,
)

urlpatterns = [
    path("", login, name="login"),
    path("register/", register, name="register"),
    path("login/", login, name="login"),
    path("logout/", logout, name="logout"),
    path("forget_password/", forget_password, name="forget_password"),
    path("reset_password/<uuid:token>", reset_password, name="reset_password"),
    path("reset_password/", set_new_password, name="set_new_password"),
    path("register/programs/<uuid:department_id>", get_programs, name="get_programs"),
]
