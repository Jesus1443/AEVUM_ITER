import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';
import '../widgets/progress_bar.dart';
import '../widgets/progress_header.dart';
import '../../data/repositories/path_repository.dart';
import '../widgets/path_timeline.dart';

class PathPage extends StatelessWidget {
  const PathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const ProgressHeader(),

            const SizedBox(height: AppSpacing.sm),

            const ProgressBar(),

            const SizedBox(height: AppSpacing.lg),

            Expanded(
              child: PathTimeline(
                nodes: const PathRepository().getNodes(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}