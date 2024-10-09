from channels.generic.websocket import AsyncWebsocketConsumer
import json


class MessageConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        if not self.scope.get("user").is_authenticated:
            await self.close(code=4001)
        else:
            self.user = self.scope["user"]
            self.scope["user"] = self.user
            self.group_name = f"user_{self.user.id}"
            await self.channel_layer.group_add(self.group_name, self.channel_name)
            await self.accept()

    async def disconnect(self, code):
        await self.channel_layer.group_discard(self.group_name, self.channel_name)

    async def receive(self, text_data):
        text_data = json.loads(text_data)
        print("new message received for ", self.group_name, text_data)
        await self.channel_layer.group_send(
            self.group_name, {"type": "chat_message", "message": text_data}
        )

    async def chat_message(self, event):
        await self.send(text_data=json.dumps(event["message"]))
