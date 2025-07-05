from .serializers import ChaletSerializer
from .models import Chalet
from rest_framework.generics import CreateAPIView, ListAPIView, UpdateAPIView

class ChaletCreateView(CreateAPIView):
    queryset = Chalet.objects.all()
    serializer_class = ChaletSerializer

class ChaletListView(ListAPIView):
    queryset = Chalet.objects.all()
    serializer_class = ChaletSerializer

class ChaletUpdateView(UpdateAPIView):
    queryset = Chalet.objects.all()
    serializer_class = ChaletSerializer

    def get_object(self):
        return self.queryset.get(id=self.kwargs['pk'])
