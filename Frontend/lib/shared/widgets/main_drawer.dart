import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/bloc/profile_bloc.dart';
import '../../core/language/app_localizations.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Drawer(
      child: Column(
        children: [
          // Header with user info
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                return _buildUserHeader(context, state.user, localizations);
              }
              return _buildLoadingHeader(context, localizations);
            },
          ),
          
          // Navigation items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Navigation Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    localizations.navigation,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.villa),
                  title: Text(localizations.chaletsBrowse),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/home');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add_business),
                  title: Text(localizations.chaletManagement),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/chalet-management');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book_online),
                  title: Text(localizations.myBookings),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Navigate to bookings page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localizations.bookingsInDevelopment)),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: Text(localizations.favorites),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Navigate to favorites page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localizations.favoritesInDevelopment)),
                    );
                  },
                ),
                
                const Divider(),
                
                // User Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    localizations.account,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(localizations.profile),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text(localizations.settings),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/settings');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_center),
                  title: Text(localizations.helpCenter),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Navigate to help center
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localizations.helpCenterInDevelopment)),
                    );
                  },
                ),
              ],
            ),
          ),
          
          // Logout button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _logout(context, localizations),
                icon: const Icon(Icons.logout),
                label: Text(localizations.logout),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserHeader(BuildContext context, dynamic user, AppLocalizations localizations) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E88E5),
            Color(0xFF1565C0),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white.withValues(alpha: 0.3),
                backgroundImage: user.profileImageUrl != null
                    ? NetworkImage(user.profileImageUrl!)
                    : null,
                child: user.profileImageUrl == null
                    ? Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.white.withValues(alpha: 0.8),
                      )
                    : null,
              ),
              const SizedBox(height: 12),
              Text(
                user.fullName ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                user.email ?? '',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingHeader(BuildContext context, AppLocalizations localizations) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E88E5),
            Color(0xFF1565C0),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white.withValues(alpha: 0.3),
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 18,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 14,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context, AppLocalizations localizations) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(localizations.confirmLogout),
          content: Text(localizations.confirmLogoutMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(localizations.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Navigator.pop(context); // Close drawer
                context.read<ProfileBloc>().add(LogoutEvent());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text(localizations.logout),
            ),
          ],
        );
      },
    );
  }
}
