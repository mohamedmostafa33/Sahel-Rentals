import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../auth/presentation/bloc/app/app_auth_bloc.dart';
import '../../../auth/presentation/bloc/profile/profile_bloc.dart';
import '../../presentation/bloc/favorites_bloc.dart';

class FavoriteButton extends StatefulWidget {
  final int chaletId;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  const FavoriteButton({
    super.key,
    required this.chaletId,
    this.size = 24,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.white,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFav = false;

  @override
  void initState() {
    super.initState();
    // Immediately check favorites status when widget is created
    _updateFavoriteStatus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check again when dependencies change (important for ListView.builder)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateFavoriteStatus();
    });
  }

  void _updateFavoriteStatus() {
    if (!mounted) return;
    final state = context.read<FavoritesBloc>().state;
    print('🔄 FavoriteButton ${widget.chaletId} - updateFavoriteStatus called, state: ${state.runtimeType}');
    if (state is FavoritesLoaded) {
      final newIsFav = state.chalets.any((c) => c.id == widget.chaletId);
      print('✅ FavoriteButton ${widget.chaletId} - Found in favorites: $newIsFav (total: ${state.chalets.length})');
      if (_isFav != newIsFav) {
        setState(() {
          _isFav = newIsFav;
        });
        print('🔄 FavoriteButton ${widget.chaletId} - Updated state: $_isFav');
      }
    } else {
      print('⏳ FavoriteButton ${widget.chaletId} - Favorites not loaded yet: ${state.runtimeType}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesBloc, FavoritesState>(
      listener: (context, state) {
        print('🎯 FavoriteButton ${widget.chaletId} - BlocListener triggered: ${state.runtimeType}');
        if (state is FavoritesLoaded) {
          final newIsFav = state.chalets.any((c) => c.id == widget.chaletId);
          print('👀 FavoriteButton ${widget.chaletId} - Listener check: newIsFav=$newIsFav, current=$_isFav');
          if (_isFav != newIsFav && mounted) {
            setState(() {
              _isFav = newIsFav;
            });
            print('🔄 FavoriteButton ${widget.chaletId} - Listener updated state to: $_isFav');
          }
        }
      },
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          // Also check in builder to ensure we always have the current state
          if (state is FavoritesLoaded) {
            final currentIsFav = state.chalets.any((c) => c.id == widget.chaletId);
            if (_isFav != currentIsFav && mounted) {
              // Update state if it's different from what we have
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _isFav = currentIsFav;
                  });
                }
              });
            }
          }
          
          return InkWell(
            onTap: () => _onPressed(context, _isFav),
            borderRadius: BorderRadius.circular(widget.size),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
              child: Icon(
                _isFav ? Icons.favorite : Icons.favorite_border,
                key: ValueKey('${widget.chaletId}_$_isFav'),
                color: _isFav ? widget.activeColor : widget.inactiveColor,
                size: widget.size,
              ),
            ),
          );
        },
      ),
    );
  }

  void _onPressed(BuildContext context, bool isFav) {
    final authState = context.read<AppAuthBloc>().state;
    if (authState is AppUnauthenticated) {
      context.go('/login');
      return;
    }

    final profileState = context.read<ProfileBloc>().state;
    if (profileState is! ProfileLoaded || profileState.user.accountType != 'renter') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Favorites available for renters only')),
      );
      return;
    }

    // Ensure favorites are loaded before trying to add/remove
    final favoritesState = context.read<FavoritesBloc>().state;
    if (favoritesState is FavoritesInitial) {
      context.read<FavoritesBloc>().add(LoadFavoritesEvent());
    }

    if (isFav) {
      context.read<FavoritesBloc>().add(RemoveFavoriteEvent(widget.chaletId));
    } else {
      context.read<FavoritesBloc>().add(AddFavoriteEvent(widget.chaletId));
    }
  }
}
