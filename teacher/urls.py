from django.urls import path
from .views import (
    upload_document,
    dashboard,
    profile,
    documents,
    student_settings,
    module_documents,
    student_messages,
    mark_as_read,
)
from django.shortcuts import redirect

urlpatterns = [
    path("", lambda request: redirect("student_dashboard"), name="student"),
    path("dashboard/", dashboard, name="student_dashboard"),
    path("profile", profile, name="student_profile"),
    path("upload/", upload_document, name="upload"),
    path("documents/", documents, name="student_documents"),
    path("documents/<uuid:module_id>", module_documents, name="module_documents"),
    path("messages/", student_messages, name="student_messages"),
    path("messages/mark_as_read/<int:id>/", mark_as_read, name="mark_as_read"),
    path("messages/delete/<int:id>/", mark_as_read, name="mark_as_read"),
    path("settings/", student_settings, name="student_settings"),
]
