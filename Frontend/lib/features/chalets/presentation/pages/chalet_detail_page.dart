import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_strings.dart';

class ChaletDetailPage extends StatelessWidget {
  final int chaletId;

  const ChaletDetailPage({
    super.key,
    required this.chaletId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey[300],
                child: const Icon(
                  Icons.villa,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'شاليه رقم $chaletId',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Text(
                        '500 ج.م / ليلة',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: AppConstants.defaultPadding),
                  
                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppConstants.primaryColor,
                      ),
                      const SizedBox(width: AppConstants.smallPadding),
                      Text(
                        'الساحل الشمالي، مصر',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: AppConstants.largePadding),
                  
                  // Amenities
                  Text(
                    AppStrings.amenities,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppConstants.defaultPadding),
                  
                  const _AmenitiesGrid(),
                  
                  const SizedBox(height: AppConstants.largePadding),
                  
                  // Description
                  Text(
                    AppStrings.description,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppConstants.defaultPadding),
                  
                  Text(
                    'شاليه فاخر يتسع لـ 8 أشخاص مع إطلالة رائعة على البحر. يحتوي على جميع المرافق اللازمة لقضاء عطلة مميزة وممتعة.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  
                  const SizedBox(height: AppConstants.largePadding * 2),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement booking
            _showBookingDialog(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: AppConstants.defaultPadding),
          ),
          child: const Text(AppStrings.bookNow),
        ),
      ),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حجز الشاليه'),
        content: const Text('سيتم تطبيق نظام الحجز قريباً'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('موافق'),
          ),
        ],
      ),
    );
  }
}

class _AmenitiesGrid extends StatelessWidget {
  const _AmenitiesGrid();

  @override
  Widget build(BuildContext context) {
    final amenities = [
      _Amenity(icon: Icons.wifi, name: 'واي فاي'),
      _Amenity(icon: Icons.pool, name: 'مسبح'),
      _Amenity(icon: Icons.air, name: 'تكييف'),
      _Amenity(icon: Icons.kitchen, name: 'مطبخ'),
      _Amenity(icon: Icons.tv, name: 'تلفزيون'),
      _Amenity(icon: Icons.local_parking, name: 'موقف سيارات'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        crossAxisSpacing: AppConstants.defaultPadding,
        mainAxisSpacing: AppConstants.defaultPadding,
      ),
      itemCount: amenities.length,
      itemBuilder: (context, index) {
        final amenity = amenities[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                amenity.icon,
                size: 30,
                color: AppConstants.primaryColor,
              ),
              const SizedBox(height: AppConstants.smallPadding),
              Text(
                amenity.name,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Amenity {
  final IconData icon;
  final String name;

  _Amenity({required this.icon, required this.name});
}
