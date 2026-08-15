"""GDPR right-to-erasure utilities.

Provides anonymise_user() to fulfil Article 17 deletion requests.
Any project-specific models that store PII linked to a user (e.g.
profiles, orders, comments) must also be anonymised or deleted here.
"""

from typing import TYPE_CHECKING

from django.db import transaction

if TYPE_CHECKING:
    from vrillees_website.users.models import User


@transaction.atomic
def anonymise_user(user: User) -> None:
    """Irreversibly anonymise a user record.

    Replaces all PII fields with anonymous placeholders, marks the
    account inactive.

    Add project-specific PII cleanup below.
    """
    anon_id = f"deleted-{user.pk}"

    user.username = anon_id
    user.email = f"{anon_id}@example.invalid"
    user.first_name = ""
    user.last_name = ""
    user.is_active = False
    user.set_unusable_password()
    user.save(
        update_fields=[
            "username",
            "email",
            "first_name",
            "last_name",
            "is_active",
            "password",
        ]
    )
