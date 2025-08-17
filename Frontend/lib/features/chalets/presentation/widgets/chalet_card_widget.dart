import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/chalet.dart';
import '../../domain/entities/public_chalet.dart';
import '../../../../core/language/app_localizations.dart';

class ChaletCardWidget extends StatelessWidget {
  final dynamic chalet; // Can be either Chalet or PublicChalet
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final Function(bool)? onToggleAvailability;

  const ChaletCardWidget({
    super.key,
    required this.chalet,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.onToggleAvailability,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Hero(
      tag: 'chalet_${chalet.id}',
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageSection(context),
                _buildContentSection(context, localizations),
                _buildActionSection(context, localizations),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        // Main image
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child:
                chalet.mainImage != null
                    ? CachedNetworkImage(
                      imageUrl: chalet.mainImage!,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => _buildPlaceholderImage(),
                    )
                    : _buildPlaceholderImage(),
          ),
        ),

        // Gradient overlay
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
            ),
          ),
        ),

        // Status badge
        Positioned(top: 16, left: 16, child: _buildStatusBadge()),

        // Image count badge
        if (chalet.imageCount > 0)
          Positioned(top: 16, right: 16, child: _buildImageCountBadge()),

        // Price badge
        Positioned(bottom: 16, right: 16, child: _buildPriceBadge()),
      ],
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Icon(Icons.home_outlined, size: 60, color: Colors.grey),
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:
            chalet.isAvailable
                ? Colors.green.withOpacity(0.9)
                : Colors.red.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            chalet.isAvailable ? Icons.check_circle : Icons.block,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            chalet.isAvailable ? 'Available' : 'Not Available',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCountBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.photo_library, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Text(
            '${chalet.imageCount}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2196F3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2196F3).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        '${chalet.pricePerNight.toStringAsFixed(0)} EGP',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildContentSection(
    BuildContext context,
    AppLocalizations localizations,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            chalet.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),

          // Location
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  chalet.location,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Details row
          Row(
            children: [
              _buildDetailChip(
                Icons.bed,
                '${chalet.numberOfRooms} ${localizations.rooms}',
              ),
              const SizedBox(width: 12),
              _buildDetailChip(
                Icons.numbers,
                '${localizations.unit} ${chalet.unitNumber}',
              ),
            ],
          ),

          // Notes preview
          if (chalet.notes?.isNotEmpty == true) ...[
            const SizedBox(height: 12),
            Text(
              chalet.notes!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF64748B)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionSection(
    BuildContext context,
    AppLocalizations localizations,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        children: [
          // Availability toggle
          Expanded(
            child: Row(
              children: [
                Text(
                  localizations.available,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: chalet.isAvailable,
                  onChanged: onToggleAvailability,
                  activeColor: Colors.green,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
          ),

          // Action buttons
          Row(
            children: [
              // Edit button
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onEdit,
                    borderRadius: BorderRadius.circular(10),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.edit,
                        color: Color(0xFF2196F3),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Delete button
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onDelete,
                    borderRadius: BorderRadius.circular(10),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.delete, color: Colors.red, size: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
