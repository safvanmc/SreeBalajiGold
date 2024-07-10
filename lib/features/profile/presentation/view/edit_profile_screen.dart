import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/profile/presentation/provider/edit_profile_provider.dart';
import 'package:sree_balagi_gold/features/profile/presentation/view/widgets/image_bottom_frame.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';
import 'package:sree_balagi_gold/general/widgets/custom_text_field.dart';
import 'package:sree_balagi_gold/general/widgets/show_progress.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    setUserData();
    super.initState();
  }

  void setUserData() {
    final editState = context.read<EditProfileProvider>();
    final userdata = context.read<AuthProvider>().userModel;
    editState.name.text = userdata!.name!;
    editState.phone.text = userdata.phoneNumber;
    editState.shopName.text = userdata.shopName!;
    editState.shopAddress.text = userdata.shopAddress!;
    editState.oldImageUrl = userdata.photoUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Edit profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<EditProfileProvider>(
          builder: (context, state, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Gap(40),
                Center(
                  child: InkWell(
                    splashFactory: InkRipple.splashFactory,
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      pickImageBottomSheet(context, state);
                    },
                    child: ImageSection(
                      image: state.newImageUrl ?? state.oldImageUrl,
                    ),
                  ),
                ),
                const Gap(40),
                CTextField(
                  label: const Text('Name'),
                  controller: state.name,
                ),
                const Gap(20),
                CTextField(
                  label: const Text('Phone number'),
                  controller: state.phone,
                  readOnly: true,
                ),
                const Gap(20),
                CTextField(
                  label: const Text('Shop Name'),
                  controller: state.shopName,
                ),
                const Gap(20),
                CTextField(
                  label: const Text('Shop Address'),
                  controller: state.shopAddress,
                ),
                const Gap(20),
                Column(
                  children: [
                    CButton(
                      height: 44,
                      color: AppColors.kBottonColor,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      onPressed: () async {
                        final nav = Navigator.of(context);
                        showProgress(context);
                        await state.updateProfile(
                          context,
                        );
                        nav.pop();
                      },
                    ),
                  ],
                ),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////////////

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image != null
            ? CircleAvatar(
                radius: 40,
                backgroundImage: image!.contains('https://')
                    ? CachedNetworkImageProvider(image!)
                    : FileImage(File(image!)),
              )
            : const CircleAvatar(
                radius: 40,
                child: Icon(
                  IconlyLight.profile,
                  size: 45,
                  color: AppColors.secondaryColor,
                )),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            AppIcons.editImage,
            scale: 4.3,
          ),
        )
      ],
    );
  }
}
