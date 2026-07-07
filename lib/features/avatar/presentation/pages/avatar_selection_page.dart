import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/avatar.dart';
import '../providers/avatar_provider.dart';
import '../widgets/avatar_grid.dart';

class AvatarSelectionPage extends ConsumerWidget {
  const AvatarSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAvatar = ref.watch(avatarProvider);
    final avatars = ref.read(avatarProvider.notifier).avatars;

    return AppScreen(
      padding: EdgeInsets.zero,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const AppTopBar(),
                    //const AppBrand(),
                    const SizedBox(height: 32),
                    const AppTitle('Elige tu avatar'),
                    const SizedBox(height: 8),
                    const AppSubtitle(
                      'Selecciona la imagen que te representará en tu viaje.',
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.52,
                      child: AvatarGrid(
                        avatars: avatars,
                        selectedAvatar: selectedAvatar,
                        onSelected: (Avatar avatar) {
                          ref
                              .read(avatarProvider.notifier)
                              .selectAvatar(avatar);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: PrimaryButton(
                text: 'Continuar',
                icon: Icons.arrow_forward_rounded,
                onPressed: selectedAvatar != null
                    ? () {
                        context.push(AppRoutes.avatarName);
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}