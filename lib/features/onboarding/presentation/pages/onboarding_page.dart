import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/onboarding_data.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_card.dart';
import '../widgets/page_indicator.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late final PageController _pageController;

  int get _lastPageIndex => OnboardingData.items.length - 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToAvatarSelection() {
    ref.read(onboardingPageProvider.notifier).reset();
    context.go(AppRoutes.avatarSelection);
  }

  void _nextPage() {
    final currentPage = ref.read(onboardingPageProvider);

    if (currentPage == _lastPageIndex) {
      _goToAvatarSelection();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(onboardingPageProvider);
    final isLastPage = currentPage == _lastPageIndex;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.logo,
                    width: 72,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: _goToAvatarSelection,
                    child: const Text(
                      'Saltar',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: OnboardingData.items.length,
                  onPageChanged: (index) {
                    ref
                        .read(onboardingPageProvider.notifier)
                        .setPage(index);
                  },
                  itemBuilder: (context, index) {
                    return OnboardingCard(
                      item: OnboardingData.items[index],
                    );
                  },
                ),
              ),

              PageIndicator(
                currentIndex: currentPage,
                totalPages: OnboardingData.items.length,
              ),

              const SizedBox(height: AppSpacing.lg),

              PrimaryButton(
                text: isLastPage ? 'Comenzar' : 'Siguiente',
                icon: isLastPage
                    ? Icons.check_rounded
                    : Icons.arrow_forward_rounded,
                onPressed: _nextPage,
              ),

              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}