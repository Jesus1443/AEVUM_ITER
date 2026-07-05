import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.go(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.logo,
                    width: screenWidth * 0.45,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Aevum Iter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      height: 1,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'DESCUBRE TU CAMINO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.4,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 80),
                  const SizedBox(
                    width: 42,
                    height: 42,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.tecnmLogo,
                      width: screenWidth * 0.26,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'TECNM TUXTEPEC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}