from rest_framework import serializers
from .models import Chalet, ChaletImage


class ChaletImageSerializer(serializers.ModelSerializer):
    image_url = serializers.SerializerMethodField()
    
    class Meta:
        model = ChaletImage
        fields = ['id', 'image', 'image_url', 'is_main', 'caption', 'order', 'created_at']
        read_only_fields = ['id', 'created_at']
    
    def get_image_url(self, obj):
        request = self.context.get('request')
        if obj.image and request:
            return request.build_absolute_uri(obj.image.url)
        return None


class ChaletSerializer(serializers.ModelSerializer):
    owner_name = serializers.CharField(source='owner.full_name', read_only=True)
    images = ChaletImageSerializer(many=True, read_only=True)
    main_image = serializers.SerializerMethodField()
    image_count = serializers.ReadOnlyField()
    unit_number = serializers.SerializerMethodField()  
    price_per_night = serializers.SerializerMethodField()  
    
    class Meta:
        model = Chalet
        fields = [
            'id', 'name', 'number_of_rooms', 'price_per_night', 'notes', 
            'created_at', 'owner_name', 'location', 'unit_number', 'is_available',
            'images', 'main_image', 'image_count'
        ]
        read_only_fields = ['id', 'created_at', 'owner_name']
    
    def get_unit_number(self, obj):
        return str(obj.unit_number)  # Ensure it's always a string
    
    def get_price_per_night(self, obj):
        return float(obj.price_per_night)  # Ensure it's always a float
    
    def get_main_image(self, obj):
        main_img = obj.main_image
        if main_img:
            request = self.context.get('request')
            if request:
                return request.build_absolute_uri(main_img.image.url)
        return None
    

class ChaletPublicSerializer(serializers.ModelSerializer):
    owner_name = serializers.CharField(source='owner.full_name', read_only=True)
    images = ChaletImageSerializer(many=True, read_only=True)
    image_count = serializers.ReadOnlyField()
    main_image = serializers.SerializerMethodField()
    
    class Meta:
        model = Chalet
        fields = [
            'id', 'owner_name', 'name', 'number_of_rooms', 'price_per_night',
            'notes', 'location', 'unit_number',
            'images', 'main_image', 'image_count'
        ]
        read_only_fields = ['id', 'created_at']
    
    def get_main_image(self, obj):
        main_img = obj.main_image
        if main_img:
            request = self.context.get('request')
            if request:
                return request.build_absolute_uri(main_img.image.url)
        return None


class ChaletCreateUpdateSerializer(serializers.ModelSerializer):
    """Serializer for creating and updating chalets without images"""
    
    class Meta:
        model = Chalet
        fields = [
            'name', 'number_of_rooms', 'price_per_night', 'notes', 
            'location', 'unit_number', 'is_available'
        ]
    
    def validate_price_per_night(self, value):
        if value <= 0:
            raise serializers.ValidationError("Price per night must be greater than 0")
        return value
    
    def validate_number_of_rooms(self, value):
        if value <= 0:
            raise serializers.ValidationError("Number of rooms must be greater than 0")
        return value


class ChaletImageUploadSerializer(serializers.ModelSerializer):
    """Serializer for uploading chalet images"""
    
    class Meta:
        model = ChaletImage
        fields = ['image', 'is_main', 'caption', 'order']
    
    def create(self, validated_data):
        chalet = self.context['chalet']
        validated_data['chalet'] = chalet
        return super().create(validated_data)