import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/chalet_management_bloc.dart';
import '../../data/models/chalet_models.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../shared/widgets/widgets.dart';

class AddChaletPage extends StatefulWidget {
  const AddChaletPage({super.key});

  @override
  State<AddChaletPage> createState() => _AddChaletPageState();
}

class _AddChaletPageState extends State<AddChaletPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _locationController = TextEditingController();
  final _unitNumberController = TextEditingController();
  final _priceController = TextEditingController();
  final _roomsController = TextEditingController();
  
  final List<File> _selectedImages = [];
  final Map<String, String> _imageCaptions = {};
  bool _isAvailable = true;
  bool _isSubmitting = false;
  int _currentStep = 0;

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
        state.whenOrNull(
          creating: () => setState(() => _isSubmitting = true),
          created: (chalet) {
            setState(() => _isSubmitting = false);
            _showSuccessDialog(context, localizations, chalet);
          },
          uploadingImages: () {
            setState(() => _isSubmitting = true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localizations.uploadingPhotos),
                backgroundColor: Colors.blue,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          imagesUploaded: (chaletId, images) {
            setState(() => _isSubmitting = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${images.length} ${localizations.imagesUploadedSuccessfully}'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.read<ChaletManagementBloc>().add(const ChaletManagementEvent.loadChalets());
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              context.go('/chalet-management');
            }
          },
          error: (message) {
            setState(() => _isSubmitting = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
      child: Stack(
        children: [
          Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            foregroundColor: Colors.white, 
            title: Text(localizations.addNewChalet),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => context.pop(),
            ),
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
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(text: localizations.basicInfo),
                Tab(text: localizations.details),
                Tab(text: localizations.photos),
              ],
            ),
          ),
          body: Form(
            key: _formKey,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _tabController.animateTo(index);
                setState(() => _currentStep = index);
              },
              children: [
                _buildBasicInfoStep(localizations),
                _buildDetailsStep(localizations),
                _buildPhotosStep(localizations),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNavigation(localizations),
        ),
        if (_isSubmitting)
          Container(
            color: Colors.black.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoStep(AppLocalizations localizations) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            localizations.basicInformation,
            localizations.enterBasicChaletInfo,
            Icons.home_outlined,
          ),
          const SizedBox(height: 24),
          
          CustomTextField(
            controller: _nameController,
            label: localizations.chaletName,
            hint: localizations.enterChaletName,
            prefixIcon: Icon(Icons.home),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return localizations.chaletNameRequired;
              }
              if (value!.trim().length < 3) {
                return localizations.chaletNameTooShort;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          CustomTextField(
            controller: _locationController,
            label: localizations.location,
            hint: localizations.enterLocation,
            prefixIcon: Icon(Icons.location_on),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return localizations.locationRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          CustomTextField(
            controller: _unitNumberController,
            label: localizations.unitNumber,
            hint: localizations.enterDescription,
            prefixIcon: Icon(Icons.numbers),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return localizations.unitNumberRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          
          _buildAvailabilityToggle(localizations),
        ],
      ),
    );
  }

  Widget _buildDetailsStep(AppLocalizations localizations) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            localizations.chaletDetails,
            localizations.enterDetailedInformation,
            Icons.info_outline,
          ),
          const SizedBox(height: 24),
          
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _roomsController,
                  label: localizations.numberOfRooms,
                  hint: '2',
                  prefixIcon: Icon(Icons.bed),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return localizations.numberOfRoomsRequired;
                    }
                    final rooms = int.tryParse(value!);
                    if (rooms == null || rooms <= 0) {
                      return localizations.invalidNumberOfRooms;
                    }
                    if (rooms > 20) {
                      return localizations.tooManyRooms;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  controller: _priceController,
                  label: localizations.pricePerNight,
                  hint: '500',
                  prefixIcon: Icon(Icons.money),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return localizations.priceRequired;
                    }
                    final price = double.tryParse(value!);
                    if (price == null || price <= 0) {
                      return localizations.invalidPrice;
                    }
                    if (price > 10000) {
                      return localizations.priceTooHigh;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          CustomTextField(
            controller: _notesController,
            label: localizations.additionalNotes,
            hint: localizations.enterAdditionalNotes,
            prefixIcon: Icon(Icons.note),
            maxLines: 4,
            validator: null,
          ),
        ],
      ),
    );
  }

  Widget _buildPhotosStep(AppLocalizations localizations) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            localizations.chaletPhotos,
            localizations.addPhotosToShowcase,
            Icons.photo_library,
          ),
          const SizedBox(height: 24),
          
          _buildImageUploadSection(localizations),
          const SizedBox(height: 24),
          
          if (_selectedImages.isNotEmpty) _buildImagePreview(localizations),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF2196F3), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailabilityToggle(AppLocalizations localizations) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(
            Icons.toggle_on,
            color: _isAvailable ? Colors.green : Colors.grey,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.availability,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E293B),
                  ),
                ),
                Text(
                  _isAvailable ? localizations.available : localizations.notAvailable,
                  style: TextStyle(
                    fontSize: 14,
                    color: _isAvailable ? Colors.green : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _isAvailable,
            onChanged: (value) => setState(() => _isAvailable = value),
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection(AppLocalizations localizations) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF2196F3).withOpacity(0.2),
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.cloud_upload,
              size: 48,
              color: Color(0xFF2196F3),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            localizations.uploadChaletPhotos,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            localizations.uploadPhotosDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildUploadButton(
                localizations.camera,
                Icons.camera_alt,
                () => _pickImages(ImageSource.camera),
              ),
              _buildUploadButton(
                localizations.gallery,
                Icons.photo_library,
                () => _pickImages(ImageSource.gallery),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton(String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF2196F3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${localizations.selectedPhotos} (${_selectedImages.length})',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: _selectedImages.length,
          itemBuilder: (context, index) {
            final image = _selectedImages[index];
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: FileImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
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
                if (index == 0)
                  Positioned(
                    bottom: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        localizations.main,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
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
                onPressed: _goToPreviousStep,
                type: ButtonType.outline,
              ),
            ),
          if (_currentStep > 0) const SizedBox(width: 16),
          Expanded(
            child: CustomButton(
              text: _currentStep == 2 ? localizations.createChalet : localizations.next,
              onPressed: _currentStep == 2 ? _submitForm : _goToNextStep,
              isLoading: _isSubmitting,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImages(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      
      if (source == ImageSource.camera) {
        final XFile? image = await picker.pickImage(source: ImageSource.camera);
        if (image != null) {
          setState(() {
            _selectedImages.add(File(image.path));
          });
        }
      } else {
        final List<XFile> images = await picker.pickMultiImage();
        if (images.isNotEmpty) {
          setState(() {
            _selectedImages.addAll(images.map((image) => File(image.path)));
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking images: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _goToPreviousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextStep() {
    if (_currentStep < 2) {

      if (_currentStep == 0 && !_validateBasicInfo()) return;
      if (_currentStep == 1 && !_validateDetails()) return;
      
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool _validateBasicInfo() {
    return _nameController.text.trim().isNotEmpty &&
           _locationController.text.trim().isNotEmpty &&
           _unitNumberController.text.trim().isNotEmpty;
  }

  bool _validateDetails() {
    final rooms = int.tryParse(_roomsController.text);
    final price = double.tryParse(_priceController.text);
    return rooms != null && rooms > 0 && price != null && price > 0;
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final request = ChaletCreateRequest(
      name: _nameController.text.trim(),
      numberOfRooms: int.parse(_roomsController.text),
      pricePerNight: double.parse(_priceController.text),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      location: _locationController.text.trim(),
      unitNumber: _unitNumberController.text.trim(),
      isAvailable: _isAvailable,
    );

    context.read<ChaletManagementBloc>().add(
      ChaletManagementEvent.createChalet(request),
    );
  }

  void _showSuccessDialog(BuildContext context, AppLocalizations localizations, ChaletModel chalet) {
    if (_selectedImages.isNotEmpty) {
      _uploadImages(chalet.id);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 28),
              const SizedBox(width: 12),
              Text(localizations.success),
            ],
          ),
          content: Text(
            localizations.chaletCreatedSuccessfully,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<ChaletManagementBloc>().add(const ChaletManagementEvent.loadChalets());
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  context.go('/chalet-management');
                }
              },
              child: Text(localizations.done),
            ),
          ],
        ),
      );
    }
  }

  void _uploadImages(int chaletId) {
    if (_selectedImages.isNotEmpty) {
      context.read<ChaletManagementBloc>().add(
        ChaletManagementEvent.uploadImages(
          chaletId,
          _selectedImages,
          captions: _imageCaptions,
        ),
      );
    } else {
      print('⚠️ No images to upload');
    }
  }
}
