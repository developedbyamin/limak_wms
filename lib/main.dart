import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:limak_courier/core/app/mealper_app.dart';
import 'package:limak_courier/core/utils/helpers/app_bloc_observer.dart';
import 'package:limak_courier/service_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  await initializeDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(Phoenix(child: const YollaApp()));
}