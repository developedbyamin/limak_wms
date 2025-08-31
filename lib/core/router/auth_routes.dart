import 'package:go_router/go_router.dart';
import 'package:limak_courier/core/router/routes.dart';
import 'package:limak_courier/src/presentation/auth/views/sign_in_view.dart';
import 'package:limak_courier/src/presentation/region/views/region_selection_view.dart';
import 'package:limak_courier/src/presentation/splash/splash_view.dart';

final List<GoRoute> authRoutes = [
  GoRoute(path: Routes.splashView, builder: (context, state) => const SplashView()),
  GoRoute(path: Routes.signInView, builder: (context, state) => const SignInView()),
  GoRoute(
    path: Routes.regionSelectionView,
    builder: (context, state) => const RegionSelectionView(),
  ),
];
