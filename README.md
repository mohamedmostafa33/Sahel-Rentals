# Sahel Rentals 🏖️

## 📋 Overview
**Sahel Rentals** is a chalet rental management system for the North Coast area, built using Django REST Framework. The system provides complete management for users and chalets with a modern API interface.

## ✨ Key Features

### 🔐 User Management (Accounts)
- **User Registration** - With comprehensive data validation
- **Login & Logout** - Using JWT Authentication
- **Password Reset** - Via OTP sent through email
- **Token Refresh** - Refresh token mechanism
- **Custom User Model** - Email as username

### 🏠 Chalet Management
- **Add New Chalet** - With complete details
- **View Chalet List** - With search and filter capabilities
- **Update Chalet Data** - Edit information
- **Delete Chalet** - Remove from system

## 🛠️ Technologies Used

### Backend
- **Django 5.2.4** - Web Framework
- **Django REST Framework 3.16.0** - API Development
- **Django REST Framework SimpleJWT 5.5.0** - JWT Authentication
- **SQLite** - Database (Development)
- **Django Environ** - Environment Variables Management

### Authentication & Security
- **JWT (JSON Web Tokens)** - Stateless Authentication
- **Token Blacklisting** - Secure Logout
- **OTP System** - Email-based Password Reset
- **Password Validation** - Strong Password Requirements

## 📁 Project Structure

```
Sahel-Rentals/
├── config/                 # Main project settings
│   ├── settings.py         # Django settings
│   ├── urls.py            # Main URL configuration
│   └── wsgi.py            # WSGI configuration
├── accounts/              # User management app
│   ├── models.py          # CustomUser and OTP models
│   ├── serializers.py     # Django REST serializers
│   ├── views.py           # API views
│   ├── urls.py            # URL patterns
│   └── admin.py           # Django admin configuration
├── chalets/               # Chalet management app
│   ├── models.py          # Chalet model
│   ├── serializers.py     # Chalet serializers
│   ├── views.py           # Chalet API views
│   └── urls.py            # Chalet URL patterns
├── env/                   # Virtual environment
├── manage.py              # Django management script
└── README.md              # Project documentation
```

## 🚀 API Endpoints

### 🔐 Authentication
```
POST   /api/register/                   # Register new user
POST   /api/login/                      # User login
POST   /api/logout/                     # User logout
POST   /api/refresh/                    # Refresh token
POST   /api/reset-password/             # Request password reset
POST   /api/reset-password-confirm/     # Confirm password reset
```

### 🏠 Chalets
```
GET    /api/list/                       # List all chalets
POST   /api/add/                        # Add new chalet
PUT    /api/update/<id>/                # Update chalet data
DELETE /api/delete/<id>/                # Delete chalet
```

## 📊 Data Models

### CustomUser Model
```python
- email (EmailField, unique)           # Email address
- full_name (CharField)                # Full name
- is_active (BooleanField)             # Active status
- is_staff (BooleanField)              # Staff permissions
- created_at (DateTimeField)           # Creation date
```

### Chalet Model
```python
- name (CharField)                     # Chalet name
- number_of_rooms (PositiveIntegerField) # Number of rooms
- price_per_night (DecimalField)       # Price per night
- notes (TextField)                    # Additional notes
- created_at (DateTimeField)           # Creation date
```

### OTP Model
```python
- email (EmailField)                   # Email address
- otp (CharField)                      # Verification code
- created_at (DateTimeField)           # Creation date
- expires_at (DateTimeField)           # Expiration date
```

## ⚙️ Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/mohamedmostafa33/Sahel-Rentals.git
cd Sahel-Rentals
```

### 2. Create Virtual Environment
```bash
python -m venv env
env\Scripts\activate  # Windows
source env/bin/activate  # Linux/Mac
```

### 3. Install Requirements
```bash
pip install django djangorestframework djangorestframework-simplejwt django-environ
```

### 4. Setup Database
```bash
python manage.py makemigrations
python manage.py migrate
```

### 5. Create Superuser
```bash
python manage.py createsuperuser
```

### 6. Run Server
```bash
python manage.py runserver
```

## 🔧 Configuration

### Environment Variables (.env)
```env
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
EMAIL_HOST_USER=your-email@gmail.com
EMAIL_HOST_PASSWORD=your-app-password
DEFAULT_FROM_EMAIL=your-email@gmail.com
```

### JWT Settings
- **Access Token Lifetime:** 5 minutes
- **Token Blacklisting:** Enabled
- **Authentication Class:** JWTAuthentication

## 🧪 Testing

```bash
# Run all tests
python manage.py test

# Test specific app
python manage.py test accounts
python manage.py test chalets
```

## 📱 API Usage Examples

### Example: Register New User
```json
POST /api/register/
{
    "email": "user@example.com",
    "full_name": "John Doe",
    "password1": "strongpassword123",
    "password2": "strongpassword123"
}
```

### Example: Add New Chalet
```json
POST /api/add/
Authorization: Bearer <access_token>
{
    "name": "Jasmine Chalet",
    "number_of_rooms": 3,
    "price_per_night": "500.00",
    "notes": "Luxury chalet with sea view"
}
```

## 🤝 Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 👨‍💻 Developer

**Mohamed Mostafa**
- GitHub: [@mohamedmostafa33](https://github.com/mohamedmostafa33)

---
⭐ If you like this project, don't forget to give it a star!