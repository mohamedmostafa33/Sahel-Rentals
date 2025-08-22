import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../chalets/domain/entities/public_chalet.dart';
import '../bloc/favorites_bloc.dart';
import '../../../auth/presentation/bloc/app/app_auth_bloc.dart';
import '../../../auth/presentation/bloc/profile/profile_bloc.dart';
import '../../../chalets/domain/entities/public_chalet.dart';
import '../../../favorites/presentation/widgets/favorite_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    // Load favorites when page opens
    context.read<FavoritesBloc>().add(LoadFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.favorites),
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/home');
          },
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: BlocConsumer<FavoritesBloc, FavoritesState>(
          listener: (context, state) {
            print('🎯 FavoritesPage - State changed to: ${state.runtimeType}');
            if (state is FavoritesLoaded) {
              print('📋 FavoritesPage - Loaded ${state.chalets.length} favorites');
              for (var chalet in state.chalets) {
                print('  - Favorite: ${chalet.id} (${chalet.name})');
              }
            }
          },
          builder: (context, state) {
            if (state is FavoritesLoading || state is FavoritesInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritesLoaded) {
              return _buildList(state.chalets);
            } else if (state is FavoritesError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildList(List<PublicChalet> chalets) {
    if (chalets.isEmpty) {
      return Center(
        child: Text(AppLocalizations.of(context)!.noData),
      );
    }

    return ListView.builder(
      itemCount: chalets.length,
      itemBuilder: (context, index) {
        final chalet = chalets[index];
        return _FavoriteChaletCard(
          key: ValueKey('favorite_chalet_${chalet.id}'),
          chalet: chalet,
        );
      },
    );
  }
}

class _FavoriteChaletCard extends StatelessWidget {
  final PublicChalet chalet;
  const _FavoriteChaletCard({super.key, required this.chalet});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: InkWell(
        onTap: () => context.push('/chalets/${chalet.id}'),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChaletImage(),
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chalet.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (chalet.ownerProfileImage != null && chalet.ownerProfileImage!.isNotEmpty) ...[
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: CachedNetworkImageProvider(
                            chalet.ownerProfileImage!,
                          ),
                        ),
                        const SizedBox(width: 6),
                      ] else ...[
                        Icon(
                          Icons.person_outline,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        chalet.ownerName,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  _buildLocationRow(context, localizations),
                  const SizedBox(height: AppConstants.smallPadding),
                  _buildDetailsRow(context, localizations),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChaletImage() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.defaultRadius),
              topRight: Radius.circular(AppConstants.defaultRadius),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppConstants.defaultRadius),
              topRight: Radius.circular(AppConstants.defaultRadius),
            ),
            child: chalet.mainImage != null
                ? CachedNetworkImage(
                    imageUrl: chalet.mainImage!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.villa,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.villa, size: 60, color: Colors.grey),
                  ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: FavoriteButton(
              key: ValueKey('fav_btn_${chalet.id}'),
              chaletId: chalet.id, 
              size: 22, 
              inactiveColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationRow(
    BuildContext context,
    AppLocalizations localizations,
  ) {
    return Row(
      children: [
        const Icon(Icons.location_on, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            chalet.location,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (chalet.imageCount > 0) ...[
          const SizedBox(width: 8),
          Row(
            children: [
              const Icon(Icons.photo_library, size: 16, color: Colors.grey),
              const SizedBox(width: 2),
              Text(
                '${chalet.imageCount}',
                style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildDetailsRow(
    BuildContext context,
    AppLocalizations localizations,
  ) {
    return Row(
      children: [
        const Icon(Icons.hotel, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          '${chalet.numberOfRooms} ${localizations.rooms}',
          style:
              Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(width: 16),
        const Icon(Icons.numbers, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          chalet.unitNumber,
          style:
              Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
        ),
        const Spacer(),
        Text(
          '${chalet.pricePerNight.toStringAsFixed(0)} ${localizations.egp} ${localizations.perNight}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppConstants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
