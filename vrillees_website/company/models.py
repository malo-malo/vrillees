from django.db import models


class Artist(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    picture = models.ImageField(upload_to="artists/")

    class Meta:
        verbose_name = "Artiste"

    def __str__(self) -> str:
        return f"Artiste : {self.first_name} {self.last_name}"

    @property
    def full_name(self) -> str:
        return f"{self.first_name} {self.last_name}"
