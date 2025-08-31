part of 'navigation_cubit.dart';

class NavigationState {
  final int selectedIndex;

  const NavigationState({required this.selectedIndex});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NavigationState && other.selectedIndex == selectedIndex;
  }

  @override
  int get hashCode => selectedIndex.hashCode;
}