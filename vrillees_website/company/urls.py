from django.urls import path

from vrillees_website.company import views

urlpatterns = [
    path("artists/", views.artists_list, name="artists_list"),
]
