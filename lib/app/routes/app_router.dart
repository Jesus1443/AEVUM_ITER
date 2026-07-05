import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.avatarSelection,
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Selección de Avatar')),
        ),
      ),
    ],
  );
}