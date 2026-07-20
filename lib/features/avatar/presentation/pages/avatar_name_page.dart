import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../profile/domain/entities/user_profile.dart';
import '../../../profile/presentation/providers/user_profile_provider.dart';
import '../providers/avatar_provider.dart';

class AvatarNamePage extends ConsumerStatefulWidget {
  const AvatarNamePage({super.key});

  @override
  ConsumerState<AvatarNamePage> createState() => _AvatarNamePageState();
}

class _AvatarNamePageState extends ConsumerState<AvatarNamePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  bool _canContinue = false;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(_validateForm);
    _ageController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final nameIsValid = _nameController.text.trim().isNotEmpty;
    final age = int.tryParse(_ageController.text.trim());
    final ageIsValid = age != null && age >= 10 && age <= 100;
    final canContinue = nameIsValid && ageIsValid;

    if (canContinue != _canContinue) {
      setState(() => _canContinue = canContinue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatar = ref.watch(avatarProvider);

    if (avatar == null) {
      return AppScreen(
        child: Center(
          child: PrimaryButton(
            text: 'Elegir avatar',
            icon: Icons.arrow_back_rounded,
            onPressed: () => context.go(AppRoutes.avatarSelection),
          ),
        ),
      );
    }

    return AppScreen(
      padding: EdgeInsets.zero,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height -
                  MediaQuery.paddingOf(context).top -
                  MediaQuery.paddingOf(context).bottom -
                  (AppSpacing.lg * 2),
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppTopBar(),
                  const SizedBox(height: AppSpacing.lg),

                  const AppTitle(
                    '¡Te ves genial!',
                    fontSize: 38,
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  const AppSubtitle(
                    'Tu camino profesional empieza aquí.',
                    fontSize: 22,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 32,
                                offset: const Offset(0, 14),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              avatar.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 12,
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  const Text(
                    'TU NOMBRE',
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.4,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  TextField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu nombre aquí...',
                      prefixIcon: const Icon(Icons.person_outline_rounded),
                      filled: true,
                      fillColor:
                          AppColors.surfaceLight.withValues(alpha: 0.65),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppRadius.circular),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.lg,
                      ),
                    ),
                  ),



                  const SizedBox(height: AppSpacing.lg),

                  const Text(
                    'TU EDAD',
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.4,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu edad...',
                      prefixIcon: const Icon(Icons.cake_outlined),
                      filled: true,
                      fillColor:
                          AppColors.surfaceLight.withValues(alpha: 0.65),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppRadius.circular),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.lg,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxxl),

                  PrimaryButton(
                    text: '¡Empezar test!',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: _canContinue
                        ? () async {
                            final name = _nameController.text.trim();
                            final age = int.parse(_ageController.text.trim());

                            await ref.read(userProfileProvider.notifier).saveProfile(
                                  UserProfile(
                                    id: 1,
                                    name: name,
                                    age: age,
                                    avatarId: avatar.id,
                                  ),
                                );

                            if (!context.mounted) return;

                            context.go(AppRoutes.test);
                          }
                        : null,
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  TextButton.icon(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.edit_outlined),
                    label: const Text(
                      'EDITAR AVATAR',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}