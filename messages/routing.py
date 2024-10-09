from django.urls import path
from .message_consumer import MessageConsumer

websocket_urlpatterns = [
    path("message", MessageConsumer.as_asgi()),
]
