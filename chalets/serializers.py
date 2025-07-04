from rest_framework import serializers
from .models import Chalet

class ChaletSerializer(serializers.ModelSerializer):
    class Meta:
        model = Chalet
        fields = ['id', 'name', 'number_of_rooms', 'price_per_night', 'notes', 'created_at']
        read_only_fields = ['id', 'created_at']