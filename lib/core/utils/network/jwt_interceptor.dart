import 'package:dio/dio.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:limak_courier/core/app/mealper_app.dart';
import 'package:limak_courier/core/router/app_router.dart';
import 'package:limak_courier/core/router/routes.dart';
import 'package:limak_courier/core/utils/storage/secure_storage.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    AuthTokens? tokens = await SecureStorage.getTokens();
    if (tokens?.accessToken != null) {
      options.headers['Authorization'] = 'Bearer ${tokens!.accessToken}';
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    if (response.data is Map<String, dynamic> &&
        response.data['message'] == 'Invalid token') {
      await SecureStorage.deleteTokens();

      // Restart the app and navigate to splash screen
      if(appContextKey.currentContext != null) {
        Phoenix.rebirth(appContextKey.currentContext!);
      }
      rootNavigatorKey.currentContext?.go(Routes.splashView);
    }

    return handler.next(response);
  }
}
