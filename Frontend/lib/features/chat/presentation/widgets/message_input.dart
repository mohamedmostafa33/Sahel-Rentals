import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/language/app_localizations.dart';

class MessageInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onRefresh;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onRefresh,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  // Helper method to detect if text is Arabic
  bool _isArabicText(String? text) {
    if (text == null || text.isEmpty) return false;
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }

  // Helper method to determine text direction
  TextDirection _getTextDirection(String? text) {
    if (_isArabicText(text)) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: widget.onRefresh,
              icon: const Icon(Icons.refresh),
              color: Colors.grey.shade600,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: widget.controller,
                  maxLines: null,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => widget.onSend(),
                  onChanged: (text) {
                    // Rebuild to update text direction
                    setState(() {});
                  },
                  textDirection: _getTextDirection(widget.controller.text),
                  decoration: InputDecoration(
                    hintText: localizations.translate('type_message'),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: AppConstants.smallPadding,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppConstants.smallPadding),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: widget.onSend,
                icon: const Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
