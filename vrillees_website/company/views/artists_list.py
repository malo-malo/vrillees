import dataclasses
from typing import TYPE_CHECKING

from django.shortcuts import render

from vrillees_website.company.models import Artist

if TYPE_CHECKING:
    from django.db.models import QuerySet
    from django.http import HttpRequest, HttpResponse


@dataclasses.dataclass
class ArtistsListContext:
    artists: QuerySet[Artist]


def artists_list(request: HttpRequest) -> HttpResponse:
    context = ArtistsListContext(artists=Artist.objects.all())
    return render(request, "company/artists_list.html", dataclasses.asdict(context))
