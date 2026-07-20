import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../avatar/data/avatar_repository.dart';
import '../../../avatar/domain/entities/avatar.dart';
import '../providers/user_profile_provider.dart';

/// Permite editar nombre, edad y avatar del perfil local.
class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _ageController;
  String? _selectedAvatarId;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(userProfileProvider);
    _nameController = TextEditingController(text: profile?.name ?? '');
    _ageController = TextEditingController(
      text: profile?.age.toString() ?? '',
    );
    _selectedAvatarId = profile?.avatarId;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final currentProfile = ref.read(userProfileProvider);
    if (currentProfile == null || _selectedAvatarId == null) return;

    final updatedProfile = currentProfile.copyWith(
      name: _nameController.text.trim(),
      age: int.parse(_ageController.text.trim()),
      avatarId: _selectedAvatarId,
    );

    await ref.read(userProfileProvider.notifier).saveProfile(updatedProfile);

    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final avatars = const AvatarRepository().getAll();

    return AppScreen(
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppTopBar(),
                const SizedBox(height: AppSpacing.lg),
                const AppTitle('Editar perfil', fontSize: 32),
                const SizedBox(height: AppSpacing.xl),
                const Text(
                  'ELIGE TU AVATAR',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: avatars.map(_buildAvatarOption).toList(),
                ),
                const SizedBox(height: AppSpacing.xl),
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration(
                    label: 'Nombre',
                    icon: Icons.person_outline_rounded,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Escribe tu nombre.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration(
                    label: 'Edad',
                    icon: Icons.cake_outlined,
                  ),
                  validator: (value) {
                    final age = int.tryParse(value?.trim() ?? '');
                    if (age == null || age < 10 || age > 100) {
                      return 'Ingresa una edad válida entre 10 y 100.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.xl),
                PrimaryButton(
                  text: 'Guardar cambios',
                  icon: Icons.save_rounded,
                  onPressed: _save,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarOption(Avatar avatar) {
    final selected = avatar.id == _selectedAvatarId;

    return GestureDetector(
      onTap: () => setState(() => _selectedAvatarId = avatar.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 86,
        height: 86,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? AppColors.primary : Colors.transparent,
            width: 4,
          ),
        ),
        child: ClipOval(
          child: Image.asset(avatar.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: AppColors.surfaceLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        borderSide: BorderSide.none,
      ),
    );
  }
}
