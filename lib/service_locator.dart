import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:limak_courier/core/config/constants/api_key.dart';
import 'package:limak_courier/core/utils/network/dio_logger.dart';
import 'package:limak_courier/core/utils/network/jwt_interceptor.dart';
import 'package:limak_courier/src/data/service/service.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = ApiKey.baseUrl;
    dio.options.followRedirects = false; // Don't automatically follow redirects
    dio.options.validateStatus = (status) {
      // Accept all status codes to handle them manually
      return status != null && status < 500;
    };
    dio.interceptors.add(AppInterceptor());
    dio.interceptors.add(DioLoggingInterceptor());
    return dio;
  });

  getIt.registerLazySingleton<CourierService>(() => CourierService(dio: getIt<Dio>()));
}

