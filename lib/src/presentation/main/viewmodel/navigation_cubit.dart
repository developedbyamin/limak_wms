import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limak_courier/core/router/routes.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(selectedIndex: 0));

  void updateSelectedIndex(int index) {
    emit(NavigationState(selectedIndex: index));
  }

  void navigateToTab(String route) {
    int index = _getIndexFromRoute(route);
    emit(NavigationState(selectedIndex: index));
  }

  int _getIndexFromRoute(String route) {
    if (route == Routes.warehouseView) {
      return 0;
    } else if (route == Routes.profileView) {
      return 1;
    }
    return 0;
  }
}