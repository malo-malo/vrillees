import pathlib
import uuid
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from django.db import models


def upload_handler(instance: models.Model, filename: str) -> str:
    ext = pathlib.Path(filename).suffix.lower()
    return f"uploads/{instance.__class__.__name__}/{uuid.uuid4().hex}{ext}"
