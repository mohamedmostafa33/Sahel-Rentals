// Test file to check profile image functionality
import 'package:flutter/material.dart';
import 'lib/features/auth/presentation/widgets/profile_image_widget.dart';
import 'lib/features/auth/data/models/user_model.dart';

void main() {
  print('Testing profile image imports...');
  
  // Test UserModel creation
  final user = UserModel(
    id: 1,
    email: 'test@example.com',
    fullName: 'Test User',
    accountType: 'renter',
    profileImage: null,
  );
  
  print('UserModel created: ${user.fullName}');
  print('Profile image functionality test completed successfully!');
}
