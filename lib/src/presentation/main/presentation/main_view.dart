import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:limak_courier/src/presentation/main/presentation/widgets/limak_bottom_app_bar.dart';
import 'package:limak_courier/src/presentation/main/viewmodel/navigation_cubit.dart';

class MainView extends StatefulWidget {
  final Widget child;
  const MainView({super.key, required this.child});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    // Initialize navigation cubit with current route
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final location = GoRouterState.of(context).uri.path;
      context.read<NavigationCubit>().navigateToTab(location);
    });
  }

  void _onItemTapped(int index) {
    context.read<NavigationCubit>().updateSelectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(children: [widget.child]),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return LimakBottomAppBar(
            selectedIndex: state.selectedIndex, 
            onTap: _onItemTapped,
          );
        },
      ),
    );
  }
}
