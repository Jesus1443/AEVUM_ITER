import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingController extends Notifier<int> {
  @override
  int build() => 0;

  void setPage(int page) {
    state = page;
  }

  void nextPage() {
    state++;
  }

  void reset() {
    state = 0;
  }
}

final onboardingPageProvider =
    NotifierProvider<OnboardingController, int>(
  OnboardingController.new,
);