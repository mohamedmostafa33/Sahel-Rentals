from .serializers import ChaletSerializer
from .models import Chalet
from rest_framework.generics import CreateAPIView

class ChaletCreateView(CreateAPIView):
    queryset = Chalet.objects.all()
    serializer_class = ChaletSerializer
