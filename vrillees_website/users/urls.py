from typing import TYPE_CHECKING

from django.urls import path

from vrillees_website.users import views

if TYPE_CHECKING:
    from django.urls import URLPattern, URLResolver

app_name = "users"

urlpatterns: list[URLPattern | URLResolver] = [
    path("account/delete/", views.delete_account, name="delete_account"),
]
