from django.db.models.signals import post_delete
from django.dispatch import receiver
from .models import CustomUser
from pathlib import Path
from django.conf import settings
import logging

logger = logging.getLogger(__name__)

@receiver(post_delete, sender=CustomUser)
def delete_profile_image_on_user_delete(sender, instance, **kwargs):
    """Delete profile image file from disk when user is deleted securely."""
    if instance.profile_image and instance.profile_image.path:
        try:
            file_path = Path(instance.profile_image.path).resolve()
            media_root = Path(settings.MEDIA_ROOT).resolve()

            if media_root in file_path.parents and file_path.is_file():
                file_path.unlink()
        except Exception as e:
            logger.warning(f"Failed to securely delete profile image for user '{instance.email}': {e}")
