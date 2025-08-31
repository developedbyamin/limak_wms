import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limak_courier/core/config/theme/app_theme.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';
import 'package:limak_courier/core/l10n/localization_cubit.dart';
import 'package:limak_courier/core/router/app_router.dart';
import 'package:limak_courier/service_locator.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/auth/viewmodel/auth_bloc.dart';
import 'package:limak_courier/src/presentation/main/viewmodel/navigation_cubit.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_cubit.dart';

final GlobalKey appContextKey = GlobalKey();

class YollaApp extends StatelessWidget {
  const YollaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationCubit()),
        BlocProvider(create: (context) => AuthBloc(courierService: getIt<CourierService>())),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => RegionCubit(courierService: getIt<CourierService>())),
      ],
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            key: appContextKey, // 🔑 Assign the global key here
            title: 'Limak courier',
            debugShowCheckedModeBanner: false,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: AppRouter.router,
            theme: AppTheme.themeLimak,
          );
        },
      ),
    );
  }
}

