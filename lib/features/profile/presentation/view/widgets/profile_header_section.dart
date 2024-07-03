import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class ProfileHeadSection extends StatelessWidget {
  const ProfileHeadSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(50),
          CircleAvatar(
            radius: 40,
            backgroundImage: state.userModel?.photoUrl != null
                ? CachedNetworkImageProvider(state.userModel!.photoUrl!)
                : null,
            child: state.userModel?.photoUrl == null
                ? const Icon(
                    IconlyLight.profile,
                    size: 45,
                    color: AppColors.secondaryColor,
                  )
                : null,
          ),
          const Gap(15),
          Text(
            state.userModel?.name ?? 'User',
            style: appTextTheme.labelLarge!.copyWith(color: Colors.black),
          ),
          Text(
            state.userModel?.phoneNumber ?? '--------',
            style: appTextTheme.bodySmall!.copyWith(
              color: Colors.black,
            ),
          ),
          const Gap(20),
        ],
      );
    });
  }
}
