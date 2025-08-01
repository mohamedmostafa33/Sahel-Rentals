from django.urls import path
from .views import (
    ChaletCreateView, ChaletListView, ChaletUpdateView, ChaletDeleteView,
    upload_chalet_images, delete_chalet_image, update_chalet_image
)

urlpatterns = [
    # Chalet CRUD operations
    path('add/', ChaletCreateView.as_view(), name='chalet-add'),
    path('list/', ChaletListView.as_view(), name='chalet-list'),
    path('update/<int:pk>/', ChaletUpdateView.as_view(), name='chalet-update'),
    path('delete/<int:pk>/', ChaletDeleteView.as_view(), name='chalet-delete'),
    
    # Image management operations
    path('<int:chalet_id>/images/upload/', upload_chalet_images, name='chalet-images-upload'),
    path('<int:chalet_id>/images/<int:image_id>/delete/', delete_chalet_image, name='chalet-image-delete'),
    path('<int:chalet_id>/images/<int:image_id>/update/', update_chalet_image, name='chalet-image-update'),
]
