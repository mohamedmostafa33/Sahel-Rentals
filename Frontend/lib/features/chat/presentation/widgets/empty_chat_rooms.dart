import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/language/app_localizations.dart';

class EmptyChatRooms extends StatelessWidget {
  final VoidCallback onRefresh;

  const EmptyChatRooms({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 100,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: AppConstants.defaultPadding * 2),
            Text(
              localizations.translate('no_chat_rooms'),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              localizations.translate('no_chat_rooms_description'),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.defaultPadding * 2),
            ElevatedButton.icon(
              onPressed: onRefresh,
              icon: const Icon(Icons.refresh),
              label: Text(localizations.translate('refresh')),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding * 2,
                  vertical: AppConstants.defaultPadding,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
