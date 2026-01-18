import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/widgets/custom_button.dart';
import 'package:t2sema/core/widgets/custom_snack_bar.dart';
import 'package:t2sema/core/widgets/custom_text_form_field.dart';
import 'package:t2sema/features/players/presentation/manager/players/players_cubit.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_image_picker.dart';

class AddPlayerDialog extends StatefulWidget {
  const AddPlayerDialog({super.key});

  @override
  State<AddPlayerDialog> createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController nameController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? selectedImage;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              hintText: 'Player Name',
              controller: nameController,
              validator: _validateName,
            ),
            const SizedBox(height: 30),
            PlayerImagePicker(image: selectedImage, onTap: _pickImage),
            const SizedBox(height: 30),
            Center(
              child: CustomButton(
                label: 'Add',
                onTap: () {
                  _onAddPlayer(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onAddPlayer(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<PlayersCubit>().addPlayer(
        name: nameController.text,
        imagePath: selectedImage?.path,
      );

      Navigator.pop(context);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    return null;
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          compressQuality: 70,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Avatar',
              toolbarColor: AppColors.primary,
              toolbarWidgetColor: Colors.white,
              cropStyle: CropStyle.circle,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
            ),
            IOSUiSettings(title: 'Crop Avatar', cropStyle: CropStyle.circle),
          ],
        );
        if (croppedFile != null) {
          setState(() {
            selectedImage = File(croppedFile.path);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(context, message: 'Failed to pick image: $e');
      }
    }
  }
}
