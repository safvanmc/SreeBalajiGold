import 'dart:io';

import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sree_balagi_gold/features/profile/presentation/view/widgets/profile_header_section.dart';
import 'package:sree_balagi_gold/features/profile/presentation/view/widgets/profile_frame.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_details.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ProfileHeadSection(),
          ),
          Container(
            color: AppColors.primaryColor,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  'Explore our complete product range! Dial or message on WhatsApp to view all',
                  style: appTextTheme.bodySmall!
                      .copyWith(fontSize: 11, color: Colors.white),
                ),
              ),
            ),
          ),
          Column(
            children: [
              ProfileFrame(
                title: 'Edit Profile',
                child: const Icon(
                  Icons.mode_edit_outlined,
                  color: AppColors.secondaryColor,
                ),
                onTap: () {},
              ),
              ProfileFrame(
                title: 'Call SBG',
                icon: AppIcons.phone,
                onTap: () {
                  EasyLauncher.call(
                    number: AppDetails.phoneNumber,
                  );
                },
              ),
              ProfileFrame(
                title: 'My Orders',
                icon: AppIcons.help,
                onTap: () {},
              ),
              ProfileFrame(
                title: 'About Us',
                icon: AppIcons.about,
                onTap: () {},
              ),
              ProfileFrame(
                title: 'Share',
                icon: AppIcons.share,
                onTap: () {
                  Share.share(
                    AppDetails.appShareLink,
                  );
                },
              ),
              ProfileFrame(
                title: 'Updates',
                icon: AppIcons.update,
                onTap: () {
                  String url;
                  if (Platform.isIOS) {
                    url = AppDetails.appStoreUrl;
                  } else {
                    url = AppDetails.playStoreUrl;
                  }
                  EasyLauncher.url(url: url);
                },
              ),
              ProfileFrame(
                title: 'Rate Us',
                icon: AppIcons.rating,
                onTap: () {
                  String url;
                  if (Platform.isIOS) {
                    url = AppDetails.appStoreUrl;
                  } else {
                    url = AppDetails.playStoreUrl;
                  }
                  EasyLauncher.url(url: url);
                },
              ),
              ProfileFrame(
                title: 'Privacy And Policy',
                icon: AppIcons.insurance,
                onTap: () {
                  EasyLauncher.url(
                    url: AppDetails.privacypolicyLink,
                  );
                },
              ),
              ProfileFrame(
                title: 'Terms And Conditions',
                icon: AppIcons.termsCondition,
                onTap: () {
                  EasyLauncher.url(
                    url: AppDetails.termsandConditionsLink,
                  );
                },
              ),
              ProfileFrame(
                title: 'Log Out',
                icon: AppIcons.exit,
                onTap: () {
                  
                },
              ),
              const Gap(20),
            ],
          ),
        ],
      ),
    );
  }
}
