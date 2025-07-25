from rest_framework import serializers
from .models import Chalet

class ChaletSerializer(serializers.ModelSerializer):
    owner_name = serializers.CharField(source='owner.full_name', read_only=True)
    
    class Meta:
        model = Chalet
        fields = ['id', 'name', 'number_of_rooms', 'price_per_night', 'notes', 'created_at', 'owner_name', 'location', 'unit_number', 'is_available']
        read_only_fields = ['id', 'created_at', 'owner_name']