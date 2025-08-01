import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../core/utils/validators.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_image_bloc.dart';
import '../widgets/profile_image_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Load profile data when page opens
    context.read<ProfileBloc>().add(LoadProfileEvent());
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _startEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  void _cancelEditing() {
    setState(() {
      _isEditing = false;
    });
    // Reload profile to reset form
    context.read<ProfileBloc>().add(LoadProfileEvent());
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileBloc>().add(
        UpdateProfileEvent(
          fullName: _fullNameController.text.trim(),
          phone: _phoneController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.profileTitle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/home');
          },
        ),
        actions: [
          if (!_isEditing)
            IconButton(
              onPressed: _startEditing,
              icon: const Icon(Icons.edit),
              tooltip: localizations.editData,
            ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileUpdated) {
                setState(() {
                  _isEditing = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is ProfileDeleted || state is ProfileLoggedOut) {
                // Navigate to login
                context.go('/login');
                if (state is ProfileDeleted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text((state as ProfileDeleted).message),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } else if (state is ProfileFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
          BlocListener<ProfileImageBloc, ProfileImageState>(
            listener: (context, state) {
              if (state is ProfileImageUploadSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم رفع الصورة بنجاح'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Reload profile to get updated image
                context.read<ProfileBloc>().add(LoadProfileEvent());
              } else if (state is ProfileImageDeleteSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم حذف الصورة بنجاح'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Reload profile to get updated image
                context.read<ProfileBloc>().add(LoadProfileEvent());
              } else if (state is ProfileImageFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProfileLoaded || state is ProfileUpdated) {
              final user = state is ProfileLoaded 
                  ? state.user 
                  : (state as ProfileUpdated).user;

              // Update controllers when data loads
              if (!_isEditing) {
                _fullNameController.text = user.fullName;
                _phoneController.text = user.phone ?? '';
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: AppConstants.defaultPadding),

                      // Profile Picture
                      ProfileImageWidget(
                        user: user,
                        size: 120,
                        showEditButton: !_isEditing,
                      ),

                      const SizedBox(height: AppConstants.largePadding),

                      // User Info Card
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppConstants.defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Full Name
                              if (_isEditing)
                                TextFormField(
                                  controller: _fullNameController,
                                  decoration: InputDecoration(
                                    labelText: localizations.fullName,
                                    prefixIcon: Icon(Icons.person_outline),
                                  ),
                                  validator: (value) => Validators.validateName(value, localizations.fullName),
                                )
                              else
                                _buildInfoItem(
                                  icon: Icons.person_outline,
                                  label: localizations.fullName,
                                  value: user.fullName,
                                ),

                              const SizedBox(height: AppConstants.defaultPadding),

                              // Email (Read-only)
                              _buildInfoItem(
                                icon: Icons.email_outlined,
                                label: localizations.email,
                                value: user.email,
                                isReadOnly: true,
                              ),

                              const SizedBox(height: AppConstants.defaultPadding),

                              // Phone
                              if (_isEditing)
                                TextFormField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    labelText: localizations.phone,
                                    prefixIcon: Icon(Icons.phone_outlined),
                                  ),
                                  validator: Validators.validatePhone,
                                )
                              else
                                _buildInfoItem(
                                  icon: Icons.phone_outlined,
                                  label: localizations.phone,
                                  value: user.phone ?? localizations.notSpecified,
                                ),

                              const SizedBox(height: AppConstants.defaultPadding),

                              // User Type (Read-only)
                              _buildInfoItem(
                                icon: user.accountType == 'owner' 
                                    ? Icons.villa_rounded 
                                    : Icons.person_rounded,
                                label: localizations.accountType,
                                value: user.accountType == 'owner' ? localizations.owner : localizations.tenant,
                                isReadOnly: true,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: AppConstants.largePadding),

                      // Action Buttons
                      if (_isEditing) ...[
                        // Save Button
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF3B82F6),
                                Color(0xFF60A5FA),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF3B82F6).withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _saveProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              localizations.saveChanges,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppConstants.defaultPadding),

                        // Cancel Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: OutlinedButton(
                            onPressed: _cancelEditing,
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              localizations.cancelEdit,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: AppConstants.largePadding),
                    ],
                  ),
                ),
              );
            }

            if (state is ProfileFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.errorMessage,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(LoadProfileEvent());
                      },
                      child: Text(localizations.retry),
                    ),
                  ],
                ),
              );
            }

            return Center(
              child: Text(localizations.loading),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    bool isReadOnly = false,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: isReadOnly 
              ? Theme.of(context).colorScheme.onSurface.withOpacity(0.6)
              : Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: AppConstants.smallPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isReadOnly 
                      ? Theme.of(context).colorScheme.onSurface.withOpacity(0.8)
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
