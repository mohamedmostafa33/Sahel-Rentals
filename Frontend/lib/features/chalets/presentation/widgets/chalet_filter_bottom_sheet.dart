import 'package:flutter/material.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../shared/widgets/widgets.dart';

class ChaletFilterBottomSheet extends StatefulWidget {
  final Map<String, dynamic> currentFilters;
  final Function(Map<String, dynamic>) onFiltersChanged;

  const ChaletFilterBottomSheet({
    super.key,
    required this.currentFilters,
    required this.onFiltersChanged,
  });

  @override
  State<ChaletFilterBottomSheet> createState() => _ChaletFilterBottomSheetState();
}

class _ChaletFilterBottomSheetState extends State<ChaletFilterBottomSheet> {
  late Map<String, dynamic> _filters;

  @override
  void initState() {
    super.initState();
    _filters = Map.from(widget.currentFilters);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    localizations.filters,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _clearFilters,
                  child: Text(
                    localizations.clear,
                    style: const TextStyle(
                      color: Color(0xFF2196F3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const Divider(height: 1),
          
          // Filters content
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Availability filter
                  _buildAvailabilityFilter(localizations),
                  const SizedBox(height: 24),
                  
                  // Price range filter
                  _buildPriceRangeFilter(localizations),
                  const SizedBox(height: 24),
                  
                  // Number of rooms filter
                  _buildRoomsFilter(localizations),
                  const SizedBox(height: 24),
                  
                  // Location filter
                  _buildLocationFilter(localizations),
                  const SizedBox(height: 24),
                  
                  // Unit number range
                  _buildUnitNumberFilter(localizations),
                  const SizedBox(height: 24),
                  
                  // Has images filter
                  _buildHasImagesFilter(localizations),
                ],
              ),
            ),
          ),
          
          // Action buttons
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton.outline(
                    text: localizations.cancel,
                    onPressed: () => Navigator.pop(context),
                    isFullWidth: true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton.primary(
                    text: localizations.apply,
                    onPressed: _applyFilters,
                    isFullWidth: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailabilityFilter(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.availability,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        
        Wrap(
          spacing: 8,
          children: [
            _buildFilterChip(
              label: localizations.all,
              isSelected: _filters['availability'] == null,
              onTap: () => setState(() => _filters['availability'] = null),
            ),
            _buildFilterChip(
              label: localizations.available,
              isSelected: _filters['availability'] == true,
              onTap: () => setState(() => _filters['availability'] = true),
            ),
            _buildFilterChip(
              label: localizations.notAvailable,
              isSelected: _filters['availability'] == false,
              onTap: () => setState(() => _filters['availability'] = false),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceRangeFilter(AppLocalizations localizations) {
    final minPrice = _filters['minPrice']?.toDouble() ?? 0.0;
    final maxPrice = _filters['maxPrice']?.toDouble() ?? 10000.0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.priceRange,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: localizations.minPrice,
                initialValue: minPrice > 0 ? minPrice.toInt().toString() : '',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final price = double.tryParse(value);
                  setState(() {
                    _filters['minPrice'] = price;
                  });
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: localizations.maxPrice,
                initialValue: maxPrice < 10000 ? maxPrice.toInt().toString() : '',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final price = double.tryParse(value);
                  setState(() {
                    _filters['maxPrice'] = price;
                  });
                },
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Price range slider
        RangeSlider(
          values: RangeValues(minPrice, maxPrice),
          min: 0,
          max: 10000,
          divisions: 100,
          labels: RangeLabels(
            '${minPrice.toInt()} EGP',
            '${maxPrice.toInt()} EGP',
          ),
          onChanged: (values) {
            setState(() {
              _filters['minPrice'] = values.start;
              _filters['maxPrice'] = values.end;
            });
          },
        ),
      ],
    );
  }

  Widget _buildRoomsFilter(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.numberOfRooms,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        
        Wrap(
          spacing: 8,
          children: [
            _buildFilterChip(
              label: localizations.any,
              isSelected: _filters['numberOfRooms'] == null,
              onTap: () => setState(() => _filters['numberOfRooms'] = null),
            ),
            for (int i = 1; i <= 6; i++)
              _buildFilterChip(
                label: i == 6 ? '6+' : i.toString(),
                isSelected: _filters['numberOfRooms'] == i,
                onTap: () => setState(() => _filters['numberOfRooms'] = i),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationFilter(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: localizations.location,
          hint: 'Enter location to filter...',
          initialValue: _filters['location'] ?? '',
          onChanged: (value) {
            setState(() {
              _filters['location'] = value.isEmpty ? null : value;
            });
          },
          prefixIcon: const Icon(Icons.location_on),
        ),
      ],
    );
  }

  Widget _buildUnitNumberFilter(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.unitNumber,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Min Unit',
                initialValue: _filters['minUnitNumber']?.toString() ?? '',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final unit = int.tryParse(value);
                  setState(() {
                    _filters['minUnitNumber'] = unit;
                  });
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: 'Max Unit',
                initialValue: _filters['maxUnitNumber']?.toString() ?? '',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final unit = int.tryParse(value);
                  setState(() {
                    _filters['maxUnitNumber'] = unit;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHasImagesFilter(AppLocalizations localizations) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Has Images',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
        Switch(
          value: _filters['hasImages'] == true,
          onChanged: (value) {
            setState(() {
              _filters['hasImages'] = value ? true : null;
            });
          },
          activeColor: const Color(0xFF2196F3),
        ),
      ],
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2196F3) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF2196F3) : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _filters.clear();
    });
  }

  void _applyFilters() {
    widget.onFiltersChanged(_filters);
    Navigator.pop(context);
  }
}

// Show filter bottom sheet function
void showChaletFilterBottomSheet(
  BuildContext context, {
  required Map<String, dynamic> currentFilters,
  required Function(Map<String, dynamic>) onFiltersChanged,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ChaletFilterBottomSheet(
        currentFilters: currentFilters,
        onFiltersChanged: onFiltersChanged,
      ),
    ),
  );
}
