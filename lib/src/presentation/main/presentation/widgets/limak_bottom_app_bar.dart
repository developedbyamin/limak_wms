import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/config/constants/app_vectors.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';
import 'package:limak_courier/core/router/routes.dart';
import 'bottom_app_bar_item.dart';

class LimakBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const LimakBottomAppBar({super.key, required this.selectedIndex, required this.onTap});

  void _onItemTapped(int index, BuildContext context) {
    onTap(index);
    
    final items = [
      Routes.warehouseView,
      Routes.profileView,
    ];
    
    context.go(items[index]);
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {'vectorPath': AppVectors.icDashboard, 'labelText': AppLocalizations.of(context)!.dashboard, 'route': Routes.warehouseView},
      {'vectorPath': AppVectors.icProfile, 'labelText': AppLocalizations.of(context)!.profile, 'route': Routes.profileView},
    ];

    return BottomAppBar(
      padding: const EdgeInsets.symmetric(vertical: 4),
      shadowColor: Colors.black,
      elevation: 30,
      height: 50,
      color: AppColors.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          items.length,
          (index) => BottomAppBarItem(
            vectorPath: items[index]['vectorPath'] as String,
            selectedIndex: selectedIndex,
            currentIndex: index,
            onTap: () => _onItemTapped(index, context),
            labelText: items[index]['labelText'] as String,
          ),
        ),
      ),
    );
  }
}
