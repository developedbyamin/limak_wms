import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:limak_courier/core/router/auth_routes.dart';
import 'package:limak_courier/core/router/routes.dart';
import 'package:limak_courier/src/presentation/main/presentation/main_view.dart';
import 'package:limak_courier/src/presentation/profile/views/profile_view.dart';
import 'package:limak_courier/src/presentation/warehouse/views/warehouse_view.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splashView,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) => MainView(child: child),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.warehouseView,
                pageBuilder:
                    (context, state) => NoTransitionPage(child: WarehouseView()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profileView,
                pageBuilder:
                    (context, state) => NoTransitionPage(child: ProfileView()),
              ),
            ],
          ),
        ],
      ),
      ...authRoutes,
    ],
  );
}
