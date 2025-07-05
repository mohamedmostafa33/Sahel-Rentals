from django.urls import path
from .views import ChaletCreateView, ChaletListView, ChaletUpdateView

urlpatterns = [
    path('add/', ChaletCreateView.as_view(), name='chalet-add'),
    path('list/', ChaletListView.as_view(), name='chalet-list'),
    path('update/<int:pk>/', ChaletUpdateView.as_view(), name='chalet-update'),
]
