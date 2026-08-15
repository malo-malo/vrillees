"""Tests for GDPR right-to-erasure functionality."""

import pytest

from vrillees_website.users.gdpr import anonymise_user
from vrillees_website.users.tests.factories import UserFactory


@pytest.mark.django_db
class TestAnonymiseUser:
    def test_pii_fields_cleared(self):
        user = UserFactory(
            first_name="Alice",
            last_name="Smith",
        )
        original_pk = user.pk
        anonymise_user(user)
        user.refresh_from_db()
        assert user.username == f"deleted-{original_pk}"
        assert user.email == f"deleted-{original_pk}@example.invalid"
        assert user.first_name == ""
        assert user.last_name == ""

    def test_account_deactivated(self):
        user = UserFactory()
        anonymise_user(user)
        user.refresh_from_db()
        assert not user.is_active
        assert not user.has_usable_password()
