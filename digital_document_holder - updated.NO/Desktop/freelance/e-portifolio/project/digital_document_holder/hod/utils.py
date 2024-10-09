from functools import wraps
from django.http import HttpResponseForbidden
from .models import *
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync


def has_permission(view_func):
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if request.user.is_authenticated and request.user.is_hod:
            return view_func(request, *args, **kwargs)
        return HttpResponseForbidden("You don't have permission to access this page.")

    return _wrapped_view


def send_message(user_id, message):
    channel = get_channel_layer()
    group_name = f"user_{user_id}"
    async_to_sync(channel.group_send)(
        group_name, {"type": "chat_message", "message": message}
    )


def check_current_password(email, current_password):
    from django.contrib.auth import authenticate

    user = authenticate(username=email, password=current_password)
    print(user)
    if user:
        return True
    return False
