import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../shared/widgets/main_drawer.dart';
import '../../../auth/presentation/bloc/profile_bloc.dart';

class ChaletsPage extends StatefulWidget {
  const ChaletsPage({super.key});

  @override
  State<ChaletsPage> createState() => _ChaletsPageState();
}

class _ChaletsPageState extends State<ChaletsPage> {
  @override
  void initState() {
    super.initState();
    // تحميل بيانات المستخدم للصورة
    context.read<ProfileBloc>().add(LoadProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.availableChalets),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileDeleted || state is ProfileLoggedOut) {
            // Navigate to login
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
        child: const Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            children: [
              // Search Bar
              _SearchBar(),
              SizedBox(height: AppConstants.defaultPadding),
              
              // Chalets List
              Expanded(
                child: _ChaletsList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add chalet (for admin)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return TextField(
      decoration: InputDecoration(
        hintText: localizations.search,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.tune),
          onPressed: () {
            // TODO: Show filter options
          },
        ),
      ),
    );
  }
}

class _ChaletsList extends StatelessWidget {
  const _ChaletsList();

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual data from BLoC
    final chalets = List.generate(10, (index) => _DummyChalet(id: index + 1));

    return ListView.builder(
      itemCount: chalets.length,
      itemBuilder: (context, index) {
        final chalet = chalets[index];
        return _ChaletCard(chalet: chalet);
      },
    );
  }
}

class _ChaletCard extends StatelessWidget {
  final _DummyChalet chalet;

  const _ChaletCard({required this.chalet});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: InkWell(
        onTap: () {
          context.push('/chalets/${chalet.id}');
        },
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chalet Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.defaultRadius),
                  topRight: Radius.circular(AppConstants.defaultRadius),
                ),
              ),
              child: const Icon(
                Icons.villa,
                size: 60,
                color: Colors.grey,
              ),
            ),
            
            // Chalet Info
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${localizations.chaletNumber} ${chalet.id}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        localizations.northCoast,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Row(
                    children: [
                      const Icon(
                        Icons.people,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '8 ${localizations.people}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '500 ${localizations.egp} ${localizations.perNight}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy data class
class _DummyChalet {
  final int id;

  _DummyChalet({required this.id});
}
