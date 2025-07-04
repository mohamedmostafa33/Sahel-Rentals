from django.urls import path
from .views import ChaletCreateView, ChaletListView

urlpatterns = [
    path('add/', ChaletCreateView.as_view(), name='chalet-add'),
    path('list/', ChaletListView.as_view(), name='chalet-list'),
]
