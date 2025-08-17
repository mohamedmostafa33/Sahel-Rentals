import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/chalet_management_bloc.dart';
import '../../domain/entities/chalet.dart';
import '../../domain/entities/chalet_image.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../shared/widgets/widgets.dart';

class ChaletManagementPage extends StatefulWidget {
  const ChaletManagementPage({super.key});

  @override
  State<ChaletManagementPage> createState() => _ChaletManagementPageState();
}

class _ChaletManagementPageState extends State<ChaletManagementPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    context.read<ChaletManagementBloc>().add(
      const ChaletManagementEvent.loadChalets(),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(localizations),
      body: BlocConsumer<ChaletManagementBloc, ChaletManagementState>(
        listener: (context, state) {
          state.whenOrNull(
            deleted: (chaletId) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(localizations.chaletDeletedSuccessfully),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            error: (message) {
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
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ChaletManagementBloc>().add(
                const ChaletManagementEvent.refreshChalets(),
              );
            },
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  _buildSearchAndFilter(localizations),
                  Expanded(
                    child: state.when(
                      initial:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      loaded:
                          (chalets, filteredChalets, searchQuery, sortBy) =>
                              _buildChaletList(localizations, filteredChalets),
                      error:
                          (message) => CustomErrorWidget(
                            title: message,
                            onRetry: () {
                              context.read<ChaletManagementBloc>().add(
                                const ChaletManagementEvent.loadChalets(),
                              );
                            },
                          ),
                      creating:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      created:
                          (_) =>
                              const Center(child: CircularProgressIndicator()),
                      updating:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      updated:
                          (_) =>
                              const Center(child: CircularProgressIndicator()),
                      deleting:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      deleted:
                          (_) =>
                              const Center(child: CircularProgressIndicator()),
                      uploadingImages:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      imagesUploaded:
                          (_, __) =>
                              const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(AppLocalizations localizations) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            context.go('/home');
          }
        },
      ),
      title: Text(
        localizations.myChalets,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.analytics_outlined),
          color: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(localizations.comingSoon)));
          },
        ),
      ],
    );
  }

  Widget _buildSearchAndFilter(AppLocalizations localizations) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
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
          Expanded(
            child: CustomSearchBar(
              controller: _searchController,
              hintText: localizations.searchChalets,
              onChanged: (query) {
                context.read<ChaletManagementBloc>().add(
                  ChaletManagementEvent.searchChalets(query),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          _buildAddChaletButton(localizations),
        ],
      ),
    );
  }

  Widget _buildAddChaletButton(AppLocalizations localizations) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2196F3).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => context.push('/add-chalet'),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.add_home,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  localizations.addChalet,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChaletList(
    AppLocalizations localizations,
    List<Chalet> chalets,
  ) {
    if (chalets.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.home_outlined,
        title: localizations.noChaletsFound,
        subtitle: localizations.tapToAddFirstChalet,
        action: ElevatedButton.icon(
          onPressed: () => context.push('/add-chalet'),
          icon: const Icon(Icons.add),
          label: Text(localizations.addChalet),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: chalets.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final chalet = chalets[index];
        return ChaletCardWidget(
          chalet: chalet,
          onTap: () => _showChaletDetails(chalet),
          onEdit: () => _editChalet(chalet),
          onDelete: () => _deleteChaletConfirmation(localizations, chalet),
          onToggleAvailability: (isAvailable) {
            context.read<ChaletManagementBloc>().add(
              ChaletManagementEvent.toggleAvailability(chalet.id, isAvailable),
            );
          },
        );
      },
    );
  }

  void _showChaletDetails(Chalet chalet) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildChaletDetailsBottomSheet(chalet),
    );
  }

  Widget _buildChaletDetailsBottomSheet(Chalet chalet) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(top: 50),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    chalet.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (chalet.images.isNotEmpty)
                    _buildImagesCarousel(chalet.images),

                  const SizedBox(height: 20),

                  _buildDetailRow(
                    localizations.location,
                    chalet.location,
                    Icons.location_on,
                  ),
                  _buildDetailRow(
                    localizations.unitNumber,
                    chalet.unitNumber,
                    Icons.numbers,
                  ),
                  _buildDetailRow(
                    localizations.numberOfRooms,
                    '${chalet.numberOfRooms}',
                    Icons.bed,
                  ),
                  _buildDetailRow(
                    localizations.pricePerNight,
                    '${chalet.pricePerNight} ${localizations.egp}',
                    Icons.attach_money,
                  ),
                  _buildDetailRow(
                    localizations.status,
                    chalet.isAvailable
                        ? localizations.available
                        : localizations.notAvailable,
                    Icons.info_outline,
                    statusColor: chalet.isAvailable ? Colors.green : Colors.red,
                  ),

                  if (chalet.notes?.isNotEmpty == true) ...[
                    const SizedBox(height: 20),
                    Text(
                      localizations.additionalNotes,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      chalet.notes!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ],

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _editChalet(chalet);
                          },
                          icon: const Icon(Icons.edit),
                          label: Text(localizations.edit),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2196F3),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _deleteChaletConfirmation(localizations, chalet);
                          },
                          icon: const Icon(Icons.delete),
                          label: Text(localizations.delete),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesCarousel(List<ChaletImage> images) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: image.image,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Container(
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.error),
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    IconData icon, {
    Color? statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF2196F3), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: statusColor ?? const Color(0xFF1E293B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _editChalet(Chalet chalet) {
    context.push('/edit-chalet/${chalet.id}');
  }

  void _deleteChaletConfirmation(
    AppLocalizations localizations,
    Chalet chalet,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                const Icon(Icons.warning, color: Colors.red, size: 28),
                const SizedBox(width: 12),
                Text(localizations.deleteChalet),
              ],
            ),
            content: Text(
              localizations.deleteChaletConfirmation(chalet.name),
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(localizations.cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<ChaletManagementBloc>().add(
                    ChaletManagementEvent.deleteChalet(chalet.id),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  localizations.delete,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }
}
