import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/widgets/widgets.dart';
import '../providers/avatar_customization_provider.dart';
import '../providers/avatar_provider.dart';
import '../widgets/avatar_customization_body.dart';

class AvatarCustomizationPage extends ConsumerWidget {
  const AvatarCustomizationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarState = ref.watch(avatarProvider);
    final customizationState = ref.watch(avatarCustomizationProvider);

    final selectedAvatar = avatarState.selectedAvatar;

    if (selectedAvatar == null) {
      return FeatureLayout(
        title: 'Sin avatar seleccionado',
        subtitle: 'Regresa y selecciona un avatar para continuar.',
        bottom: PrimaryButton(
          text: 'Elegir avatar',
          icon: Icons.arrow_back_rounded,
          onPressed: () => context.go(AppRoutes.avatarSelection),
        ),
        child: const SizedBox.shrink(),
      );
    }

    final customizationNotifier =
        ref.read(avatarCustomizationProvider.notifier);

    return FeatureLayout(
      title: 'Personaliza tu avatar',
      subtitle: 'Haz que tu compañero tenga un estilo único.',
      bottom: PrimaryButton(
        text: 'Guardar avatar',
        icon: Icons.check_rounded,
        onPressed: () {
          context.go(AppRoutes.path);
        },
      ),
      child: AvatarCustomizationBody(
        avatar: selectedAvatar,
        state: customizationState,
        onTabChanged: customizationNotifier.changeTab,
        onHairStyleChanged: customizationNotifier.changeHairStyle,
        onHairColorChanged: customizationNotifier.changeHairColor,
        onOutfitChanged: customizationNotifier.changeOutfit,
      ),
    );
  }
}