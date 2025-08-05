import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/chalet_management_bloc.dart';
import '../../data/models/chalet_models.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../shared/widgets/widgets.dart';

class EditChaletPage extends StatefulWidget {
  final int chaletId;
  
  const EditChaletPage({
    super.key,
    required this.chaletId,
  });

  @override
  State<EditChaletPage> createState() => _EditChaletPageState();
}

class _EditChaletPageState extends State<EditChaletPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _locationController = TextEditingController();
  final _unitNumberController = TextEditingController();
  final _priceController = TextEditingController();
  final _roomsController = TextEditingController();
  
  List<File> _newImages = [];
  Map<String, String> _imageCaptions = {};
  bool _isAvailable = true;
  bool _isSubmitting = false;
  int _currentStep = 0;
  ChaletModel? _currentChalet;
  bool _isFormInitialized = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
    
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.animateToPage(
          _tabController.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    _loadChaletData();
  }

  void _loadChaletData() {
    context.read<ChaletManagementBloc>().add(const ChaletManagementEvent.loadChalets());
  }

  void _populateForm(ChaletModel chalet) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _nameController.text = chalet.name;
          _notesController.text = chalet.notes ?? '';
          _locationController.text = chalet.location;
          _unitNumberController.text = chalet.unitNumber;
          _priceController.text = chalet.pricePerNight.toString();
          _roomsController.text = chalet.numberOfRooms.toString();
          _isAvailable = chalet.isAvailable;
          _currentChalet = chalet;
          _isFormInitialized = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _nameController.dispose();
    _notesController.dispose();
    _locationController.dispose();
    _unitNumberController.dispose();
    _priceController.dispose();
    _roomsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return BlocListener<ChaletManagementBloc, ChaletManagementState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
          },
          loaded: (chalets, filteredChalets, searchQuery, sortBy) {
            try {
              final chalet = chalets.firstWhere(
                (c) => c.id == widget.chaletId,
              );
              setState(() {
                _currentChalet = chalet;
              });
              if (_nameController.text.isEmpty) {
                _populateForm(chalet);
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Chalet not found: $e'),
                  backgroundColor: Colors.red,
                ),
              );
              Navigator.of(context).pop();
            }
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
          creating: () {},
          created: (chalet) {},
          updating: () {
            setState(() {
              _isSubmitting = true;
            });
          },
          updated: (chalet) {
            setState(() {
              _isSubmitting = false;
            });
            _showSuccessDialog(localizations, chalet);
          },
          deleting: () {},
          deleted: (chaletId) {},
          uploadingImages: () {},
          imagesUploaded: (chaletId, images) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${images.length} images uploaded successfully'),
                backgroundColor: Colors.green,
              ),
            );
            context.read<ChaletManagementBloc>().add(const ChaletManagementEvent.loadChalets());
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              context.go('/chalet-management');
            }
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.white, 
          title: Text(localizations.editChalet),
          flexibleSpace: Container(
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
          ),
          bottom: _currentChalet == null
              ? null
              : TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  tabs: [
                    Tab(text: localizations.basicInfo),
                    Tab(text: localizations.images),
                    Tab(text: localizations.review),
                  ],
                ),
        ),
        body: _currentChalet == null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading chalet data...'),
                  ],
                ),
              )
            : PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _tabController.animateTo(index);
                  setState(() {
                    _currentStep = index;
                  });
                },
                children: [
                  _buildBasicInfoStep(localizations),
                  _buildImagesStep(localizations),
                  _buildReviewStep(localizations),
                ],
              ),
        bottomNavigationBar:
            _currentChalet == null ? null : _buildBottomNavigation(localizations),
      ),
      );
    }

  Widget _buildBasicInfoStep(AppLocalizations localizations) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: localizations.chaletName,
                prefixIcon: const Icon(Icons.home),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return localizations.fieldRequired;
                }
                if (value.trim().length < 3) {
                  return localizations.nameMinLength;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: localizations.location,
                prefixIcon: const Icon(Icons.location_on),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return localizations.fieldRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _unitNumberController,
              decoration: InputDecoration(
                labelText: localizations.unitNumber,
                prefixIcon: const Icon(Icons.numbers),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return localizations.fieldRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _roomsController,
                    decoration: InputDecoration(
                      labelText: localizations.numberOfRooms,
                      prefixIcon: const Icon(Icons.bed),
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return localizations.fieldRequired;
                      }
                      final rooms = int.tryParse(value);
                      if (rooms == null || rooms <= 0) {
                        return localizations.invalidNumber;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: localizations.pricePerNight,
                      prefixIcon: const Icon(Icons.money),
                      border: const OutlineInputBorder(),
                      suffix: Text(localizations.currency),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return localizations.fieldRequired;
                      }
                      final price = double.tryParse(value);
                      if (price == null || price <= 0) {
                        return localizations.invalidPrice;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: localizations.notes,
                prefixIcon: const Icon(Icons.note),
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            SwitchListTile(
              title: Text(localizations.isAvailable),
              subtitle: Text(
                _isAvailable ? localizations.available : localizations.notAvailable,
              ),
              value: _isAvailable,
              onChanged: (value) {
                setState(() {
                  _isAvailable = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagesStep(AppLocalizations localizations) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_currentChalet?.images.isNotEmpty == true) ...[
            Text(
              localizations.existingImages,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: _currentChalet!.images.length,
              itemBuilder: (context, index) {
                final image = _currentChalet!.images[index];
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: image.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    if (image.isMain)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            localizations.mainImage,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () => _deleteExistingImage(image.id),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
          ],

          Text(
            localizations.addNewImages,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),

          OutlinedButton.icon(
            onPressed: _pickImages,
            icon: const Icon(Icons.add_photo_alternate),
            label: Text(localizations.selectImages),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(16),
            ),
          ),
          const SizedBox(height: 16),

          if (_newImages.isNotEmpty) ...[
            Text(
              '${localizations.selectedImages} (${_newImages.length})',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: _newImages.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _newImages[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () => _removeImage(index),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReviewStep(AppLocalizations localizations) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.chaletInformation,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  _buildReviewItem(localizations.chaletName, _nameController.text),
                  _buildReviewItem(localizations.location, _locationController.text),
                  _buildReviewItem(localizations.unitNumber, _unitNumberController.text),
                  _buildReviewItem(localizations.numberOfRooms, _roomsController.text),
                  _buildReviewItem(
                    localizations.pricePerNight,
                    '${_priceController.text} ${localizations.currency}',
                  ),
                  _buildReviewItem(
                    localizations.availability,
                    _isAvailable ? localizations.available : localizations.notAvailable,
                  ),
                  if (_notesController.text.isNotEmpty)
                    _buildReviewItem(localizations.notes, _notesController.text),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.images,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${localizations.existingImages}: ${_currentChalet?.images.length ?? 0}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '${localizations.newImages}: ${_newImages.length}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value.isNotEmpty ? value : '-'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(AppLocalizations localizations) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: CustomButton(
                text: localizations.previous,
                onPressed: _previousStep,
                type: ButtonType.outline,
              ),
            ),
          if (_currentStep > 0) const SizedBox(width: 16),
          Expanded(
            child: _currentStep < 2
                ? CustomButton(
                    text: localizations.next,
                    onPressed: _nextStep,
                  )
                : CustomButton(
                    text: localizations.updateChalet,
                    onPressed: (_isSubmitting || _currentChalet == null || !_isFormInitialized) ? null : _updateChalet,
                    isLoading: _isSubmitting || (_currentChalet == null || !_isFormInitialized),
                  ),
          ),
        ],
      ),
    );
  }

  void _nextStep() {
    if (_currentStep < 2) {
      if (_currentStep == 0) {
        if (!_validateFormData()) {
          return;
        }
      }
      
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
    
    if (images.isNotEmpty) {
      setState(() {
        _newImages.addAll(images.map((image) => File(image.path)));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _newImages.removeAt(index);
    });
  }

  void _deleteExistingImage(int imageId) {
    if (_currentChalet != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Delete Image'),
          content: Text('Are you sure you want to delete this image?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<ChaletManagementBloc>().add(
                  ChaletManagementEvent.deleteImage(_currentChalet!.id, imageId),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Deleting image...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Delete'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      );
    }
  }

  void _updateChalet() {
    if (_currentChalet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chalet data not loaded, please wait...'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (!_isFormInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is still loading, please wait...'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (!_validateFormData()) {
      setState(() {
        _currentStep = 0;
      });
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    _performUpdate();
  }

  bool _validateFormData() {
    if (_nameController.text.trim().isEmpty) {
      _showValidationError('Chalet name is required');
      return false;
    }
    if (_nameController.text.trim().length < 3) {
      _showValidationError('Chalet name must be at least 3 characters');
      return false;
    }

    if (_locationController.text.trim().isEmpty) {
      _showValidationError('Location is required');
      return false;
    }

    if (_unitNumberController.text.trim().isEmpty) {
      _showValidationError('Unit number is required');
      return false;
    }

    final rooms = int.tryParse(_roomsController.text);
    if (rooms == null || rooms <= 0) {
      _showValidationError('Please enter a valid number of rooms');
      return false;
    }

    final price = double.tryParse(_priceController.text);
    if (price == null || price <= 0) {
      _showValidationError('Please enter a valid price');
      return false;
    }

    return true;
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _performUpdate() {
    final request = ChaletUpdateRequest(
      name: _nameController.text.trim(),
      numberOfRooms: int.parse(_roomsController.text),
      pricePerNight: double.parse(_priceController.text),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      location: _locationController.text.trim(),
      unitNumber: _unitNumberController.text.trim(),
      isAvailable: _isAvailable,
    );

    context.read<ChaletManagementBloc>().add(
      ChaletManagementEvent.updateChalet(widget.chaletId, request),
    );
  }

  void _showSuccessDialog(AppLocalizations localizations, ChaletModel chalet) {
    if (_newImages.isNotEmpty) {
      _uploadNewImages(chalet.id);
    } else {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        context.go('/chalet-management');
      }
    }
  }

  void _uploadNewImages(int chaletId) {
    if (_newImages.isNotEmpty) {
      context.read<ChaletManagementBloc>().add(
        ChaletManagementEvent.uploadImages(
          chaletId,
          _newImages,
          captions: _imageCaptions,
        ),
      );
    }
  }
}
