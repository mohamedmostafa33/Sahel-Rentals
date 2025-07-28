from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView
from .views import (
    UserRegistrationView, 
    UserLoginView, 
    UserLogoutView, 
    ResetPasswordRequestView,
    ResetPasswordConfirmView,
    UserProfileView,
    DeleteAccountView,
    ProfileImageUploadView
)

urlpatterns = [
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('register/', UserRegistrationView.as_view(), name='user_register'),
    path('login/', UserLoginView.as_view(), name='user_login'),
    path('logout/', UserLogoutView.as_view(), name='user_logout'),
    path('profile/', UserProfileView.as_view(), name='user_profile'),
    path('profile/image/', ProfileImageUploadView.as_view(), name='profile_image'),
    path('delete-account/', DeleteAccountView.as_view(), name='delete_account'),
    path('reset-password/', ResetPasswordRequestView.as_view(), name='reset_password_request'),
    path('reset-password-confirm/', ResetPasswordConfirmView.as_view(), name='reset_password_confirm'),
]