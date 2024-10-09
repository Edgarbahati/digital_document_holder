import os
from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application
from channels.auth import AuthMiddlewareStack
from messages.routing import websocket_urlpatterns

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mysite.settings")

# Django's ASGI application for handling traditional HTTP requests
django_asgi_app = get_asgi_application()

application = ProtocolTypeRouter(
    {
        # HTTP protocol handling via Django
        "http": django_asgi_app,
        # WebSocket protocol handling with AuthMiddlewareStack
        "websocket": AuthMiddlewareStack(
            URLRouter(websocket_urlpatterns)  # Routing for WebSocket connections
        ),
    }
)
