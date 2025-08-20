import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../shared/widgets/main_drawer.dart';
import '../../../auth/presentation/bloc/profile/profile_bloc.dart';
import '../bloc/chalet_browse_bloc.dart';
import '../../domain/entities/public_chalet.dart';

class ChaletsPage extends StatefulWidget {
  const ChaletsPage({super.key});

  @override
  State<ChaletsPage> createState() => _ChaletsPageState();
}

class _ChaletsPageState extends State<ChaletsPage> with WidgetsBindingObserver {
  final TextEditingController _searchController = TextEditingController();
  bool _hasNavigatedAway = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<ProfileBloc>().add(LoadProfileEvent());
    context.read<ChaletBrowseBloc>().add(const ChaletBrowseEvent.loadChalets());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInitialized && _hasNavigatedAway) {
      final modalRoute = ModalRoute.of(context);
      if (modalRoute != null && modalRoute.isCurrent) {
        context.read<ChaletBrowseBloc>().add(
          const ChaletBrowseEvent.restoreChaletsList(),
        );
        _hasNavigatedAway = false;
      }
    }
    if (!_isInitialized) {
      _isInitialized = true;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && _hasNavigatedAway) {
      context.read<ChaletBrowseBloc>().add(
        const ChaletBrowseEvent.restoreChaletsList(),
      );
      _hasNavigatedAway = false;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.availableChalets),
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
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      drawer: const MainDrawer(),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileDeleted || state is ProfileLoggedOut) {
            context.go('/login');
            if (state is ProfileDeleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
            }
          } else if (state is ProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ChaletBrowseBloc>().add(
              const ChaletBrowseEvent.refreshChalets(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                _SearchBar(controller: _searchController),
                const SizedBox(height: AppConstants.defaultPadding),
                Expanded(
                  child: _ChaletsList(
                    onNavigate: () {
                      setState(() {
                        _hasNavigatedAway = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const _SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return TextField(
      controller: controller,
      onChanged: (query) {
        context.read<ChaletBrowseBloc>().add(
          ChaletBrowseEvent.searchChalets(query),
        );
      },
      decoration: InputDecoration(
        hintText: localizations.search,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            controller.clear();
            context.read<ChaletBrowseBloc>().add(
              const ChaletBrowseEvent.searchChalets(''),
            );
          },
        ),
      ),
    );
  }
}

class _ChaletsList extends StatelessWidget {
  final VoidCallback onNavigate;

  const _ChaletsList({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return BlocBuilder<ChaletBrowseBloc, ChaletBrowseState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => _buildLoadingList(),
          loaded: (chalets, paginationInfo) {
            if (chalets.isEmpty) {
              return _buildEmptyState(localizations);
            }
            return _buildChaletsList(chalets, paginationInfo, context);
          },
          loadingMore: (chalets, paginationInfo) {
            return _buildChaletsList(
              chalets,
              paginationInfo,
              context,
              isLoadingMore: true,
            );
          },
          chaletDetailLoaded: (chalet, previousList, paginationInfo) {
            if (previousList.isEmpty) {
              return _buildEmptyState(localizations);
            }
            return _buildChaletsList(previousList, paginationInfo, context);
          },
          failure: (error) => _buildErrorState(error, localizations, context),
        );
      },
    );
  }

  Widget _buildLoadingList() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => _buildShimmerCard(),
    );
  }

  Widget _buildShimmerCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(height: 16, width: 150, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(height: 16, width: 100, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations localizations) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.villa_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            localizations.noChaletsAvailable,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            localizations.pullToRefresh,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    String error,
    AppLocalizations localizations,
    BuildContext context,
  ) {
    return Center(
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
              BlocProvider.of<ChaletBrowseBloc>(
                context,
              ).add(const ChaletBrowseEvent.loadChalets());
            },
            child: Text(localizations.retry),
          ),
        ],
      ),
    );
  }

  Widget _buildChaletsList(
    List<PublicChalet> chalets,
    dynamic paginationInfo,
    BuildContext context, {
    bool isLoadingMore = false,
  }) {
    final hasNext = paginationInfo?.hasNext ?? false;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        // Trigger load more when user scrolls near the bottom
        if (!isLoadingMore &&
            hasNext &&
            scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 200) {
          context.read<ChaletBrowseBloc>().add(
            const ChaletBrowseEvent.loadMoreChalets(),
          );
        }
        return false;
      },
      child: ListView.builder(
        itemCount: chalets.length + (hasNext ? 1 : 0),
        itemBuilder: (context, index) {
          // Show loading indicator at the end if there are more pages
          if (index == chalets.length) {
            return _buildLoadMoreIndicator(isLoadingMore);
          }

          final chalet = chalets[index];
          return _ChaletCard(
            chalet: chalet,
            onTap: () {
              onNavigate();
              context.push('/chalets/${chalet.id}');
            },
          );
        },
      ),
    );
  }

  Widget _buildLoadMoreIndicator(bool isLoadingMore) {
    if (isLoadingMore) {
      return Container(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Center(
        child: Text(
          'Scroll to load more...',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
      ),
    );
  }
}

class _ChaletCard extends StatelessWidget {
  final PublicChalet chalet;
  final VoidCallback? onTap;

  const _ChaletCard({required this.chalet, this.onTap});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: InkWell(
        onTap:
            onTap ??
            () {
              context.push('/chalets/${chalet.id}');
            },
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
    return Container(
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
        child:
            chalet.mainImage != null
                ? CachedNetworkImage(
                  imageUrl: chalet.mainImage!,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Container(
                        color: Colors.grey[300],
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget:
                      (context, url, error) => Container(
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
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
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
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
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
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(width: 16),
        const Icon(Icons.numbers, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          chalet.unitNumber,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
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
