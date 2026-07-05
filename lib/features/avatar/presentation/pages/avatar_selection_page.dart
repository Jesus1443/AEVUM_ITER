import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/avatar_data.dart';
import '../../domain/entities/avatar.dart';
import '../providers/avatar_provider.dart';
import '../widgets/avatar_grid.dart';

class AvatarSelectionPage extends ConsumerWidget {
  const AvatarSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(avatarProvider);

    return FeatureLayout(
      title: 'Elige tu compañero',
      subtitle:
          'Selecciona el avatar que te acompañará durante todo tu viaje.',
      bottom: PrimaryButton(
        text: 'Continuar',
        icon: Icons.arrow_forward_rounded,
        onPressed: state.hasSelection
            ? () {
                context.go(AppRoutes.avatarCustomization);
              }
            : null,
      ),
      child: AvatarGrid(
        avatars: AvatarData.avatars,
        selectedAvatar: state.selectedAvatar,
        onSelected: (Avatar avatar) {
          ref.read(avatarProvider.notifier).selectAvatar(avatar);
        },
      ),
    );
  }
}