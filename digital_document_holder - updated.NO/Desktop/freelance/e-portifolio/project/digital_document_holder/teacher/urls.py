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
    path("", lambda request: redirect("teacher_dashboard"), name="teacher"),
    path("profile/", profile, name="teacher_profile"),
    path("dashboard/", dashboard, name="teacher_dashboard"),
    path("upload/", upload, name="teacher_upload"),
    path("folders/", folders, name="teacher_folders"),
    path("announcement/", announcements, name="teacher_announcement"),
    path("settings/", hod_settings, name="teacher_settings"),
    path("documents/", module_documents, name="teacher_documents"),
     

    
  
]
