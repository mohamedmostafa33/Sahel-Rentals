import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../core/storage/token_storage.dart';
import '../bloc/chalet_browse_bloc.dart';
import '../../domain/entities/public_chalet.dart';
import '../widgets/chalet_image_viewer.dart';
import '../../../chat/presentation/bloc/chat_rooms_bloc.dart';

class ChaletDetailPage extends StatefulWidget {
  final int chaletId;

  const ChaletDetailPage({super.key, required this.chaletId});

  @override
  State<ChaletDetailPage> createState() => _ChaletDetailPageState();
}

class _ChaletDetailPageState extends State<ChaletDetailPage> {
  List<String> _buildUniqueImageUrls(PublicChalet chalet) {
    final imageUrls = <String>[];
    final addedUrls = <String>{};

    if (chalet.mainImage != null && chalet.mainImage!.isNotEmpty) {
      imageUrls.add(chalet.mainImage!);
      addedUrls.add(chalet.mainImage!);
    }

    for (final imageModel in chalet.images) {
      if (imageModel.image.isNotEmpty &&
          !addedUrls.contains(imageModel.image)) {
        imageUrls.add(imageModel.image);
        addedUrls.add(imageModel.image);
      }
    }

    return imageUrls;
  }

  @override
  void initState() {
    super.initState();
    context.read<ChaletBrowseBloc>().add(
      ChaletBrowseEvent.loadChaletDetail(widget.chaletId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocBuilder<ChaletBrowseBloc, ChaletBrowseState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoadingState(),
            loading: () => _buildLoadingState(),
            loaded:
                (chalets, paginationInfo) => _buildNotFoundState(localizations),
            loadingMore:
                (chalets, paginationInfo) => _buildNotFoundState(localizations),
            chaletDetailLoaded:
                (chalet, previousList, paginationInfo) =>
                    _buildChaletDetail(chalet, localizations),
            failure: (error) => _buildErrorState(error, localizations),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.chaletDetails),
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppConstants.defaultRadius,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppConstants.defaultRadius,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 20,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotFoundState(AppLocalizations localizations) {
    return Scaffold(
      appBar: AppBar(title: Text(localizations.chaletDetails)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.villa_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              localizations.chaletNotFound,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error, AppLocalizations localizations) {
    return Scaffold(
      appBar: AppBar(title: Text(localizations.chaletDetails)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
            const SizedBox(height: 16),
            Text(
              localizations.error,
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<ChaletBrowseBloc>().add(
                  ChaletBrowseEvent.loadChaletDetail(widget.chaletId),
                );
              },
              child: Text(localizations.retry),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChaletDetail(
    PublicChalet chalet,
    AppLocalizations localizations,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chalet.name),
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _buildImageSliver(chalet),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOwnerAndLocationSection(chalet, localizations),
                  const SizedBox(height: AppConstants.defaultPadding),

                  _buildDetailsSection(chalet, localizations),
                  const SizedBox(height: AppConstants.defaultPadding),

                  if (chalet.notes != null && chalet.notes!.isNotEmpty)
                    _buildNotesSection(chalet, localizations),

                  if (chalet.images.isNotEmpty) ...[
                    const SizedBox(height: AppConstants.defaultPadding),
                    _buildImagesSection(chalet, localizations),
                  ],

                  const SizedBox(height: AppConstants.defaultPadding * 2),
                  FutureBuilder<Map<String, String?>>(
                    future: TokenStorage.getUserInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      }
                      
                      final userInfo = snapshot.data;
                      final userType = userInfo?['type'];
                      
                      if (userInfo == null || userType == null || userType.isEmpty || userType == 'renter') {
                        return _buildContactOwnerSection(chalet, localizations);
                      }
                      
                      return const SizedBox.shrink();
                    },
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSliver(PublicChalet chalet) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
            child: GestureDetector(
              onTap: () {
                final imageUrls = _buildUniqueImageUrls(chalet);

                if (imageUrls.isNotEmpty) {
                  showChaletImageViewer(
                    context: context,
                    imageUrls: imageUrls,
                    initialIndex: 0,
                    chaletName: chalet.name,
                  );
                }
              },
              child: Stack(
                children: [
                  chalet.mainImage != null
                      ? CachedNetworkImage(
                        imageUrl: chalet.mainImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder:
                            (context, url) => Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(
                                  AppConstants.defaultRadius,
                                ),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        errorWidget:
                            (context, url, error) => Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(
                                  AppConstants.defaultRadius,
                                ),
                              ),
                              child: const Icon(
                                Icons.villa,
                                size: 100,
                                color: Colors.grey,
                              ),
                            ),
                      )
                      : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(
                            AppConstants.defaultRadius,
                          ),
                        ),
                        child: const Icon(
                          Icons.villa,
                          size: 100,
                          color: Colors.grey,
                        ),
                      ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppConstants.defaultRadius,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.5],
                      ),
                    ),
                  ),
                  if (chalet.mainImage != null)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.zoom_in,
                          color: AppConstants.primaryColor,
                          size: 22,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOwnerAndLocationSection(
    PublicChalet chalet,
    AppLocalizations localizations,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    chalet.ownerName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (chalet.phone?.hasPhone == true) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      chalet.phone!.phone!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    chalet.location,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppConstants.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${chalet.pricePerNight.toStringAsFixed(0)} ${localizations.egp}\n${localizations.perNight}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppConstants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildTitleSection(
    PublicChalet chalet,
    AppLocalizations localizations,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chalet.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    chalet.ownerName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (chalet.phone?.hasPhone == true) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      chalet.phone!.phone!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    chalet.location,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppConstants.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${chalet.pricePerNight.toStringAsFixed(0)} ${localizations.egp}\n${localizations.perNight}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppConstants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(
    PublicChalet chalet,
    AppLocalizations localizations,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.details,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConstants.defaultPadding),

        _buildDetailRow(
          Icons.hotel,
          localizations.rooms,
          '${chalet.numberOfRooms} ${localizations.rooms}',
        ),

        _buildDetailRow(
          Icons.numbers,
          localizations.unitNumber,
          chalet.unitNumber,
        ),

        if (chalet.imageCount > 0)
          _buildDetailRow(
            Icons.photo_library,
            localizations.images,
            '${chalet.imageCount} ${localizations.images}',
          ),
      ],
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.smallPadding),
      child: Row(
        children: [
          Icon(icon, color: AppConstants.primaryColor, size: 20),
          const SizedBox(width: AppConstants.smallPadding),
          Text(
            '$label: ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: valueColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection(
    PublicChalet chalet,
    AppLocalizations localizations,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.notes,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
          child: Text(
            chalet.notes!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildImagesSection(
    PublicChalet chalet,
    AppLocalizations localizations,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.images,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chalet.images.length,
            itemBuilder: (context, index) {
              final image = chalet.images[index];
              return GestureDetector(
                onTap: () {
                  final imageUrls = _buildUniqueImageUrls(chalet);

                  int initialIndex = imageUrls.indexOf(image.image);
                  if (initialIndex == -1) initialIndex = 0;

                  showChaletImageViewer(
                    context: context,
                    imageUrls: imageUrls,
                    initialIndex: initialIndex,
                    chaletName: chalet.name,
                  );
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(
                    right: AppConstants.smallPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppConstants.defaultRadius,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppConstants.defaultRadius,
                    ),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: image.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder:
                              (context, url) => Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                          errorWidget:
                              (context, url, error) => Container(
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.image,
                                  color: Colors.grey,
                                ),
                              ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppConstants.defaultRadius,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.center,
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.7],
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(
                            Icons.zoom_in,
                            color: Colors.white,
                            size: 18,
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContactOwnerSection(
    PublicChalet chalet,
    AppLocalizations localizations,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.chat_bubble_outline,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: AppConstants.smallPadding),
              Text(
                localizations.translate('contact_owner'),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.smallPadding),
          Text(
            'تواصل مع ${chalet.ownerName} للاستفسار عن الحجز وتفاصيل الشاليه',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          SizedBox(
            width: double.infinity,
            child: BlocConsumer<ChatRoomsBloc, ChatRoomsState>(
              listener: (context, state) {
                state.whenOrNull(
                  chatRoomCreated: (chatRoom) {
                    context.push('/chat/${chatRoom.id}', extra: chatRoom);
                  },
                  failure: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  loading: () => true,
                  creatingChatRoom: () => true,
                  orElse: () => false,
                );

                return ElevatedButton.icon(
                  onPressed: isLoading ? null : () => _contactOwner(chalet),
                  icon:
                      isLoading
                          ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                          : const Icon(Icons.chat),
                  label: Text(
                    isLoading
                        ? localizations.loading
                        : localizations.translate('contact_owner'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppConstants.defaultPadding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.defaultRadius,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _contactOwner(PublicChalet chalet) async {
    try {
      final isLoggedIn = await TokenStorage.isLoggedIn();
      if (!isLoggedIn) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppLocalizations.of(context)!.translate('please_login_first'),
              ),
              backgroundColor: Colors.orange,
            ),
          );
          context.push('/login');
        }
        return;
      }

      final userInfo = await TokenStorage.getUserInfo();
      final userType = userInfo['type'];

      if (userType == 'owner') {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppLocalizations.of(
                  context,
                )!.translate('owners_cannot_contact_owners'),
              ),
              backgroundColor: Colors.orange,
            ),
          );
        }
        return;
      }

      if (mounted) {
        context.read<ChatRoomsBloc>().add(
          ChatRoomsEvent.createOrGetChatRoom(chaletId: chalet.id),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ أثناء فتح المحادثة: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
