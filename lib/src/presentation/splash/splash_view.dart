import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/router/routes.dart';
import 'package:limak_courier/src/presentation/auth/viewmodel/auth_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isAuthenticated = false;

  void _checkAndNavigate() {
    if (isAuthenticated) {
      context.go(Routes.regionSelectionView);
    } else if (!isAuthenticated) {
      context.go(Routes.signInView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listenWhen: (previous, current) => previous != current,
              listener: (context, state) {
                if (state is Authenticated) {
                  setState(() {
                    isAuthenticated = true;
                  });
                  _checkAndNavigate();
                } else if (state is Unauthenticated) {
                  setState(() {
                    isAuthenticated = false;
                  });
                  _checkAndNavigate();
                }
              },
            ),
          ],
          child: Center(child: Text('Limak', style: TextStyle(color: AppColors.whiteColor, fontSize: 32, fontWeight: FontWeight.w600),)),
        ),
      ),
    );
  }
}
