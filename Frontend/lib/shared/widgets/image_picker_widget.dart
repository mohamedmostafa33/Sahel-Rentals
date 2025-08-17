import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/language/app_localizations.dart';

class ImagePickerWidget extends StatefulWidget {
  final List<String> initialImages;
  final Function(List<File>) onImagesChanged;
  final int maxImages;
  final bool allowMultiple;
  final String? title;
  final String? subtitle;

  const ImagePickerWidget({
    super.key,
    this.initialImages = const [],
    required this.onImagesChanged,
    this.maxImages = 10,
    this.allowMultiple = true,
    this.title,
    this.subtitle,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  final List<File> _selectedImages = [];
  List<String> _networkImages = [];

  @override
  void initState() {
    super.initState();
    _networkImages = List.from(widget.initialImages);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final totalImages = _selectedImages.length + _networkImages.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          if (widget.subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.subtitle!,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
          const SizedBox(height: 16),
        ],

        // Image grid
        if (totalImages > 0) ...[
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: totalImages + (totalImages < widget.maxImages ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < _networkImages.length) {
                // Network image
                return _buildNetworkImageItem(_networkImages[index], index);
              } else if (index < totalImages) {
                // Local file image
                final fileIndex = index - _networkImages.length;
                return _buildFileImageItem(_selectedImages[fileIndex], index);
              } else {
                // Add button
                return _buildAddButton();
              }
            },
          ),
          const SizedBox(height: 16),
        ] else ...[
          // Empty state
          _buildEmptyState(localizations),
          const SizedBox(height: 16),
        ],

        // Add images button (if no images or can add more)
        if (totalImages == 0 || totalImages < widget.maxImages)
          _buildAddImagesButton(localizations, totalImages),
      ],
    );
  }

  Widget _buildNetworkImageItem(String imageUrl, int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder:
                  (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
              errorWidget:
                  (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.error, color: Colors.red),
                  ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => _removeNetworkImage(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileImageItem(File imageFile, int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => _removeFileImage(index - _networkImages.length),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: _pickImages,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate, color: Colors.grey[500], size: 32),
            const SizedBox(height: 4),
            Text(
              'Add',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations localizations) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!, style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Icon(Icons.photo_library_outlined, size: 48, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No images selected',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the button below to add photos',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAddImagesButton(
    AppLocalizations localizations,
    int currentCount,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _pickImages,
        icon: const Icon(Icons.add_photo_alternate),
        label: Text(
          currentCount == 0
              ? 'Add Photos'
              : 'Add More Photos (${widget.maxImages - currentCount} remaining)',
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2196F3),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImages() async {
    try {
      final totalImages = _selectedImages.length + _networkImages.length;
      final remainingSlots = widget.maxImages - totalImages;

      if (remainingSlots <= 0) {
        _showMessage('Maximum number of images reached');
        return;
      }

      List<XFile> pickedFiles = [];

      if (widget.allowMultiple && remainingSlots > 1) {
        pickedFiles = await _picker.pickMultiImage();
      } else {
        final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          pickedFiles = [pickedFile];
        }
      }

      if (pickedFiles.isNotEmpty) {
        // Limit to remaining slots
        final filesToAdd = pickedFiles.take(remainingSlots).toList();

        final newFiles = filesToAdd.map((xFile) => File(xFile.path)).toList();

        setState(() {
          _selectedImages.addAll(newFiles);
        });

        widget.onImagesChanged(_selectedImages);

        if (filesToAdd.length < pickedFiles.length) {
          _showMessage(
            'Only ${filesToAdd.length} images were added due to limit',
          );
        }
      }
    } catch (e) {
      _showMessage('Error picking images: $e');
    }
  }

  void _removeFileImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
    widget.onImagesChanged(_selectedImages);
  }

  void _removeNetworkImage(int index) {
    setState(() {
      _networkImages.removeAt(index);
    });
  }

  void _showMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: const Color(0xFF2196F3),
        ),
      );
    }
  }
}

// Single image picker widget
class SingleImagePickerWidget extends StatefulWidget {
  final String? initialImage;
  final Function(File?) onImageChanged;
  final String? title;
  final String? subtitle;
  final double? height;
  final double? width;

  const SingleImagePickerWidget({
    super.key,
    this.initialImage,
    required this.onImageChanged,
    this.title,
    this.subtitle,
    this.height,
    this.width,
  });

  @override
  State<SingleImagePickerWidget> createState() =>
      _SingleImagePickerWidgetState();
}

class _SingleImagePickerWidgetState extends State<SingleImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  String? _networkImage;

  @override
  void initState() {
    super.initState();
    _networkImage = widget.initialImage;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          if (widget.subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.subtitle!,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
          const SizedBox(height: 12),
        ],

        // Image container
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: widget.width ?? double.infinity,
            height: widget.height ?? 200,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!, width: 1.5),
            ),
            child: _buildImageContent(),
          ),
        ),

        // Actions
        if (_selectedImage != null || _networkImage != null) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.edit),
                  label: const Text('Change Image'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _removeImage,
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildImageContent() {
    if (_selectedImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    if (_networkImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: _networkImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          placeholder:
              (context, url) => Container(
                color: Colors.grey[200],
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
          errorWidget: (context, url, error) => _buildPlaceholder(),
        ),
      );
    }

    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add_photo_alternate, size: 48, color: Colors.grey[400]),
        const SizedBox(height: 8),
        Text(
          'Tap to add image',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          _networkImage = null;
        });
        widget.onImageChanged(_selectedImage);
      }
    } catch (e) {
      _showMessage('Error picking image: $e');
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _networkImage = null;
    });
    widget.onImageChanged(null);
  }

  void _showMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: const Color(0xFF2196F3),
        ),
      );
    }
  }
}
