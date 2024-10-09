import fitz
from PIL import Image
import numpy as np
import re
from .models import StudentLogs, StudentMessages
from functools import wraps
from django.http import HttpResponseForbidden
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync


def send_message(user_id, message):
    channel = get_channel_layer()
    group_name = f"user_{user_id}"
    async_to_sync(channel.group_send)(
        group_name, {"type": "chat_message", "message": message}
    )


def search_regnumbers(extracted_text):
    pattern = r"\d+\s*[rR][pP]\s*\d+"
    matches = re.findall(pattern, extracted_text)
    return matches if matches else []


def verify_document(file, easyocr_reader, student, module, document, user):
    try:
        print("your document is being verified")
        file_content = file.read()
        extracted_text = ""
        doc = fitz.open(stream=file_content)
        zoom = 8
        pages = 0
        mat = fitz.Matrix(zoom, zoom)
        for page in doc:
            pages += 1
        for i in range(pages):
            page = doc.load_page(i)
            pix = page.get_pixmap(matrix=mat)
            img = Image.frombytes("RGB", [pix.width, pix.height], pix.samples)
            img_np = np.array(img)
            result = easyocr_reader.readtext(img_np)
            for _, text, _ in result:
                extracted_text += text
            extracted_text += " "

        # prepare current student info
        message = StudentMessages(student=student)
        message.sender = user
        log = StudentLogs()
        log.student = student

        # Check if any regnumber found in the uploaded document
        if search_regnumbers(extracted_text):
            # normailze regnumbers
            regnumbers = [
                regnumber.lower().replace(" ", "") for regnumber in regnumbers
            ]
            for regnumber in regnumbers:
                #   check if there is any regnumber match with current user's regnumber
                if regnumber.lower().replace(" ", "") == user.regnumber:
                    document.status = "verified"
                    message.message = "Your document verification passed"
                    document.save()
                    message.save()
                    log.save()
                    # send message to student in realtime
                    send_message(
                        message.student.user.id, "Your document verified by AI"
                    )
                    break
        else:
            log.student = student
            log.activity = f"Upload new {module} document uploaded"
            message.message = "Your document verification failed"
            message.save()
            log.save()
            # send message to student in realtime
            send_message(
                message.student.user.id, "Your document marked as failed by AI"
            )
        print("verification completed")

    except:
        send_message(message.student.user.id, "Your document marked as failed by AI")


def has_permission(view_func):
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if request.user.is_authenticated and request.user.is_student:
            return view_func(request, *args, **kwargs)
        return HttpResponseForbidden("You don't have permission to access this page")

    return _wrapped_view


def check_current_password(email, current_password):
    from django.contrib.auth import authenticate

    user = authenticate(username=email, password=current_password)
    print(user)
    if user:
        return True
    return False
