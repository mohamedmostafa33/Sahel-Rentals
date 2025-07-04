from django.urls import path
from .views import ChaletCreateView

urlpatterns = [
    path('add/', ChaletCreateView.as_view(), name='chalet-add'),
]
