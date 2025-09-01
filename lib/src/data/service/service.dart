import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:limak_courier/core/utils/storage/secure_storage.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'dart:io';

class CourierService {
  final Dio _dio;

  CourierService({required Dio dio}) : _dio = dio;

  // Get Storage by Barcode
  Future<StorageResponse> getStorage(String barcodeId) async {
    try {
      debugPrint('Fetching storage for barcode: $barcodeId');

      final response = await _dio.get('/get/storage', queryParameters: {
        'barcode_id': barcodeId,
      });

      debugPrint('Storage response status: ${response.statusCode}');
      debugPrint('Storage response data: ${response.data}');

      if (response.statusCode == 200) {
        return StorageResponse.fromJson(response.data);
      } else {
        throw 'Failed to fetch storage with status: ${response.statusCode}';
      }
    } on DioException catch (e) {
      debugPrint('Storage DioException: ${e.response?.statusCode} - ${e.response?.data}');
      
      // Try to extract error message from response
      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          final errorData = e.response!.data as Map<String, dynamic>;
          final message = errorData['message'] ?? errorData['error'] ?? 'Failed to fetch storage';
          throw message;
        }
      }
      
      throw 'Failed to fetch storage. Please try again.';
    }
  }

  // Store in Depot
  Future<StoreInDepotResponse> storeInDepot(int regionId, String depotId, String invoiceId) async {
    try {
      debugPrint('Storing in depot - Region: $regionId, Depot: $depotId, Invoice: $invoiceId');

      final response = await _dio.post('/store-in-depot', queryParameters: {
        'region_id': regionId,
        'depot_id': depotId,
        'invoice_id': invoiceId,
      });

      debugPrint('Store in depot response status: ${response.statusCode}');
      debugPrint('Store in depot response data: ${response.data}');

      if (response.statusCode == 200) {
        return StoreInDepotResponse.fromJson(response.data);
      } else {
        throw 'Failed to store in depot with status: ${response.statusCode}';
      }
    } on DioException catch (e) {
      debugPrint('Store in depot DioException: ${e.response?.statusCode} - ${e.response?.data}');
      
      // Try to extract error message from response
      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          final errorData = e.response!.data as Map<String, dynamic>;
          final message = errorData['message'] ?? errorData['error'] ?? 'Failed to store in depot';
          throw message;
        }
      }
      
      throw 'Failed to store in depot. Please try again.';
    }
  }

  // Get Packages
  Future<PackageResponse> getPackages({
    required int regionId,
    String? uniqid,
    String? fullname,
    String? fin,
    String? purchaseNo,
  }) async {
    try {
      debugPrint('Fetching packages with params: regionId=$regionId, uniqid=$uniqid, fullname=$fullname, fin=$fin, purchaseNo=$purchaseNo');

      final queryParams = <String, dynamic>{
        'region_id': regionId,
      };

      if (uniqid != null && uniqid.isNotEmpty) {
        queryParams['uniqid'] = uniqid;
      }
      if (fullname != null && fullname.isNotEmpty) {
        queryParams['fullname'] = fullname;
      }
      if (fin != null && fin.isNotEmpty) {
        queryParams['fin'] = fin;
      }
      if (purchaseNo != null && purchaseNo.isNotEmpty) {
        queryParams['purchase_no'] = purchaseNo;
      }

      final response = await _dio.get('/get/packages', queryParameters: queryParams);

      debugPrint('Packages response status: ${response.statusCode}');
      debugPrint('Packages response data: ${response.data}');

      if (response.statusCode == 200) {
        return PackageResponse.fromJson(response.data);
      } else {
        throw 'Failed to fetch packages with status: ${response.statusCode}';
      }
    } on DioException catch (e) {
      debugPrint('Packages DioException: ${e.response?.statusCode} - ${e.response?.data}');
      
      // Try to extract error message from response
      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          final errorData = e.response!.data as Map<String, dynamic>;
          final message = errorData['message'] ?? errorData['error'] ?? 'Failed to fetch packages';
          throw message;
        }
      }
      
      throw 'Failed to fetch packages. Please try again.';
    }
  }

  // Deliver Packages
  Future<DeliveryResponse> deliverPackages({
    required int regionId,
    required List<String> invoiceIds,
    required File proveImage,
  }) async {
    try {
      debugPrint('Delivering packages - Region: $regionId, Invoices: ${invoiceIds.join(",")}');

      // Create form data
      final formData = FormData.fromMap({
        'region_id': regionId,
        'invoice_ids': invoiceIds.join(','),
        'prove_image': await MultipartFile.fromFile(
          proveImage.path,
          filename: 'prove_image.jpg',
        ),
      });

      final response = await _dio.post('/deliver', data: formData);

      debugPrint('Deliver response status: ${response.statusCode}');
      debugPrint('Deliver response data: ${response.data}');

      if (response.statusCode == 200) {
        return DeliveryResponse.fromJson(response.data);
      } else {
        throw 'Failed to deliver packages with status: ${response.statusCode}';
      }
    } on DioException catch (e) {
      debugPrint('Deliver DioException: ${e.response?.statusCode} - ${e.response?.data}');
      
      // Try to extract error message from response
      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          final errorData = e.response!.data as Map<String, dynamic>;
          final message = errorData['message'] ?? errorData['error'] ?? 'Failed to deliver packages';
          throw message;
        }
      }
      
      throw 'Failed to deliver packages. Please try again.';
    }
  }

  // Get Region Details
  Future<RegionDetailsResponse> getRegionDetails(int regionId) async {
    try {
      debugPrint('Fetching region details for region: $regionId');

      final response = await _dio.get('/get/region-details', queryParameters: {
        'region_id': regionId,
      });

      debugPrint('Region details response status: ${response.statusCode}');
      debugPrint('Region details response data: ${response.data}');

      if (response.statusCode == 200) {
        return RegionDetailsResponse.fromJson(response.data);
      } else {
        throw 'Failed to fetch region details with status: ${response.statusCode}';
      }
    } on DioException catch (e) {
      debugPrint('Region details DioException: ${e.response?.statusCode} - ${e.response?.data}');
      
      // Try to extract error message from response
      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          final errorData = e.response!.data as Map<String, dynamic>;
          final message = errorData['message'] ?? errorData['error'] ?? 'Failed to fetch region details';
          throw message;
        }
      }
      
      throw 'Failed to fetch region details. Please try again.';
    }
  }

  // Get Account
  Future<AccountResponse> getAccount(int regionId) async {
    try {
      debugPrint('Fetching account for region: $regionId');

      final response = await _dio.get('/get/account', queryParameters: {
        'region_id': regionId,
      });

      debugPrint('Account response status: ${response.statusCode}');
      debugPrint('Account response data: ${response.data}');

      if (response.statusCode == 200) {
        return AccountResponse.fromJson(response.data);
      } else {
        throw 'Failed to fetch account with status: ${response.statusCode}';
      }
    } on DioException catch (e) {
      debugPrint('Account DioException: ${e.response?.statusCode} - ${e.response?.data}');
      
      // Try to extract error message from response
      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          final errorData = e.response!.data as Map<String, dynamic>;
          final message = errorData['message'] ?? errorData['error'] ?? 'Failed to fetch account';
          throw message;
        }
      }
      
      throw 'Failed to fetch account. Please try again.';
    }
  }

  // Get Regions
  Future<RegionsResponse> getRegions() async {
    try {
      debugPrint('Fetching regions...');

      final response = await _dio.get('/get/regions');

      debugPrint('Regions response status: ${response.statusCode}');
      debugPrint('Regions response data: ${response.data}');

      if (response.statusCode == 200) {
        return RegionsResponse.fromJson(response.data);
      } else {
        throw 'Failed to fetch regions with status: ${response.statusCode}';
      }
    } on DioException catch (e) {
      debugPrint('Regions DioException: ${e.response?.statusCode} - ${e.response?.data}');
      
      // Try to extract error message from response
      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          final errorData = e.response!.data as Map<String, dynamic>;
          final message = errorData['message'] ?? errorData['error'] ?? 'Failed to fetch regions';
          throw message;
        }
      }
      
      throw 'Failed to fetch regions. Please try again.';
    }
  }

  // Login
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      debugPrint('Login request: ${loginRequest.toJson()}');

      final response = await _dio.post(
        '/depot/login',
        data: loginRequest.toJson(),
      );

      debugPrint('Login response status: ${response.statusCode}');
      debugPrint('Login response data: ${response.data}');

      // Check if login was successful
      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);
        
        if (loginResponse.success && loginResponse.token != null) {
          Future.microtask(() {
            AuthTokens authTokens = AuthTokens(
              accessToken: loginResponse.token!,
              refreshToken: loginResponse.token!,
            );
            SecureStorage.saveTokens(authTokens);
          });
          return loginResponse;
                  } else {
            throw loginResponse.message ?? 'Login failed';
          }
      } else {
        throw 'Login failed with status: ${response.statusCode}';
      }
    } on DioException catch (e) {
      debugPrint('Login DioException: ${e.response?.statusCode} - ${e.response?.data}');
      
      if (e.response?.statusCode == 401) {
        throw 'Invalid username or password';
      }
      
      // Try to extract error message from response
      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          final errorData = e.response!.data as Map<String, dynamic>;
          final message = errorData['message'] ?? errorData['error'] ?? 'Login failed';
          throw message;
        }
      }
      
      throw 'Login failed. Please try again.';
    }
  }
}