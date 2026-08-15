from factory import django
from factory.declarations import Sequence

from vrillees_website.users.models import User


class UserFactory(django.DjangoModelFactory):
    username = Sequence(lambda n: f"user-{n}")
    email = Sequence(lambda n: f"user-{n}@example.com")
    password = django.Password("testpass")

    class Meta:
        model = User
