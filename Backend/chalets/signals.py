import os
import logging
from pathlib import Path
from shutil import rmtree
from django.db.models.signals import post_delete
from django.dispatch import receiver
from django.conf import settings
from .models import Chalet, ChaletImage

logger = logging.getLogger(__name__)

@receiver(post_delete, sender=ChaletImage)
def delete_image_file_on_delete(sender, instance, **kwargs):
    """Delete image file from disk when ChaletImage is deleted."""
    if instance.image and instance.image.path:
        try:
            if os.path.exists(instance.image.path):
                os.remove(instance.image.path)
        except Exception as e:
            logger.warning(f"Failed to delete image file '{instance.image.path}': {e}")

@receiver(post_delete, sender=Chalet)
def delete_chalet_folder_on_delete(sender, instance, **kwargs):
    """Securely delete chalet folder from disk when Chalet is deleted."""
    try:
        folder_path = Path(settings.MEDIA_ROOT) / 'chalets' / str(instance.id)
        folder_path = folder_path.resolve()
        media_root = Path(settings.MEDIA_ROOT).resolve()

        if media_root in folder_path.parents and folder_path.is_dir():
            rmtree(folder_path)
    except Exception as e:
        logger.warning(f"Failed to securely delete chalet folder '{folder_path}': {e}")
