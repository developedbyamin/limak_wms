// sign_in_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';
import 'package:limak_courier/core/l10n/localization_cubit.dart';
import 'package:limak_courier/core/router/routes.dart';
import 'package:limak_courier/core/utils/helpers/overlay_helper.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'package:limak_courier/src/presentation/auth/viewmodel/auth_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  void _signIn(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      final loginRequest = LoginRequest(
        username: usernameController.text,
        password: passwordController.text,
      );
      context.read<AuthBloc>().add(AuthSignIn(loginRequest: loginRequest));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "LIMAK DEPO",
            style: TextStyle(
              color: AppColors.whiteColor.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.version,
            style: TextStyle(
              color: AppColors.whiteColor.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSignInSuccess) {
                context.go(Routes.regionSelectionView);
              }
              if (state is AuthSignInFailure) {
                OverlayHelper.showError(context, state.errorMessage);
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Center(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 120),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Language Switcher
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: DropdownButton<Locale>(
                                  value: context.watch<LocalizationCubit>().state,
                                  dropdownColor: Colors.white,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  underline: Container(),
                                  borderRadius: BorderRadius.circular(12),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  selectedItemBuilder: (BuildContext context) {
                                    return [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('🇦🇿', style: TextStyle(fontSize: 16)),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Azərbaycan',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('🇺🇸', style: TextStyle(fontSize: 16)),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'English',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('🇷🇺', style: TextStyle(fontSize: 16)),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Русский',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ];
                                  },
                                  onChanged: (Locale? newLocale) {
                                    if (newLocale != null) {
                                      context.read<LocalizationCubit>().changeLocale(newLocale);
                                    }
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      value: const Locale('az'),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('🇦🇿', style: TextStyle(fontSize: 20)),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Azərbaycan',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: const Locale('en'),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('🇺🇸', style: TextStyle(fontSize: 20)),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'English',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: const Locale('ru'),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('🇷🇺', style: TextStyle(fontSize: 20)),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Русский',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // App Title
                            Text(
                              AppLocalizations.of(context)!.appTitle,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 260,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  AppLocalizations.of(context)!.signInTitle,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: 260,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                controller: usernameController,
                                focusNode: usernameFocus,
                                cursorColor: AppColors.primaryColor,
                                decoration: InputDecoration(
                                  fillColor: AppColors.whiteColor,
                                  filled: true,
                                  hintText: AppLocalizations.of(context)!.username,
                                  hintStyle: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  errorStyle: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                validator: (value) => (value == null || value.isEmpty)
                                    ? AppLocalizations.of(context)!.usernameEmpty
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: 260,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                controller: passwordController,
                                focusNode: passwordFocus,
                                obscureText: obscure,
                                cursorColor: AppColors.primaryColor,
                                decoration: InputDecoration(
                                  fillColor: AppColors.whiteColor,
                                  filled: true,
                                  hintText: AppLocalizations.of(context)!.password,
                                  hintStyle: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  errorStyle: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => setState(() => obscure = !obscure),
                                    icon: Icon(
                                      obscure ? Icons.visibility_off : Icons.visibility,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                validator: (value) => (value == null || value.isEmpty)
                                    ? AppLocalizations.of(context)!.passwordEmpty
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 40),
                            InkWell(
                              onTap: () => _signIn(context),
                              child: Container(
                                width: 260,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                    width: 0.3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.20),
                                      blurRadius: 8,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                alignment: Alignment.center,
                                child: BlocBuilder<AuthBloc, AuthState>(
                                  builder: (context, state) {
                                    if (state is AuthLoading) {
                                      return const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    }
                                    return Text(
                                      AppLocalizations.of(context)!.signIn,
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}