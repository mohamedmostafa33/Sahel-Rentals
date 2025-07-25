class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phone;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    required this.createdAt,
    required this.updatedAt,
  });
  
  String get fullName => '$firstName $lastName';
}
