import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:limak_courier/core/utils/storage/secure_storage.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'package:limak_courier/src/data/service/service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CourierService courierService;
  AuthBloc({required this.courierService}) : super(AuthInitial()) {
    on<AuthCheck>(_onAuthCheck);
    on<AuthSignIn>(_onAuthSignIn);

    add(AuthCheck());
  }

  Future<void> _onAuthCheck(AuthCheck event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final AuthTokens? tokens = await SecureStorage.getTokens();
      if (tokens == null || tokens.refreshToken.isEmpty) {
        emit(Unauthenticated());
        return;
      }
      emit(Authenticated());
    } catch (e, stackTrace) {
      debugPrint("Error while checking token: $e\n$stackTrace");
      emit(Unauthenticated());
    }
  }

  Future<void> _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      var response = await courierService.login(
        event.loginRequest
      );
      emit(AuthSignInSuccess(loginResponse: response));
    } catch (e) {
      debugPrint("Error while checking token: $e");
      emit(AuthSignInFailure(errorMessage: e.toString()));
    }
  }
}
