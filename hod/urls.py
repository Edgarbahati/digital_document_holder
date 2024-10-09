from django.urls import path
from .views import (
    dashboard,
    profile,
    hod_settings,
    upload,
    folders,
    announcements,
    year_modules,
    module_students,
    module_documents,
    change_document_status,
    delete_document,
)
from django.shortcuts import redirect


urlpatterns = [
    path("", lambda request: redirect("hod_dashboard"), name="hod"),
    path("profile/", profile, name="hod_profile"),
    path("dashboard/", dashboard, name="hod_dashboard"),
    path("upload/", upload, name="hod_upload"),
    path("folders/", folders, name="hod_folders"),
    path("announcement/", announcements, name="hod_announcement"),
    path("settings/", hod_settings, name="hod_settings"),
    path(
        "year_modules/<uuid:program_id>/<int:year>",
        year_modules,
        name="year_modules",
    ),
    path("students/<uuid:module_id>", module_students, name="hod_module_students"),
    path(
        "students/documents/<uuid:module_id>/<int:student_id>",
        module_documents,
        name="hod_student_documents",
    ),
    path(
        "status/<int:document_id>/<str:new_status>/",
        change_document_status,
        name="hod_change_document_status",
    ),
    path(
        "delete/<int:document_id>/",
        delete_document,
        name="hod_delete_document",
    ),
]
