import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/avatar/presentation/pages/avatar_selection_page.dart';
import '../../features/avatar/presentation/pages/avatar_name_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

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
        builder: (context, state) => const AvatarSelectionPage(),
      ),
      GoRoute(  
        path: AppRoutes.avatarName,
        builder: (context, state) => const AvatarNamePage(),
      ),
      GoRoute(
        path: AppRoutes.path,
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Path'),
          ),
        ),
      ),
    ],
  );
}