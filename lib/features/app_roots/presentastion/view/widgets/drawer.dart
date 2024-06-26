import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/provider/app_root_provider.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/app_root_screen.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/widgets/sub%20widgets/drawer_header_section.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/widgets/sub%20widgets/drawer_list_tile.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/widgets/sub%20widgets/logout_section.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class NavDrawerWidget extends StatelessWidget {
  const NavDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const BeveledRectangleBorder(),

        width: MediaQuery.sizeOf(context).width / 1.3,
        backgroundColor: kwhiteColor,
        child: Consumer<AppRootProvider>(
          builder: (context, state, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: HeadSection(),
              ),

              Container(
                color: primaryColor,
                height: 70,
                // transform: Matrix4.translationValues(-15.0, 0, 0.0),
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
                  DrawerListTile(
                    title: 'Call SBG',
                    icon: phone,
                    onTap: () {
                      state.makingPhoneCall();
                    },
                  ),
                  DrawerListTile(
                    title: 'My Orders',
                    icon: help,
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppRootScreen(index: 3),
                          ));
                    },
                  ),
                  DrawerListTile(
                    title: 'About Us',
                    icon: about,
                    onTap: () {},
                  ),
                  DrawerListTile(
                    title: 'Share',
                    icon: share,
                    onTap: () {
                      state.onShare(context);
                    },
                  ),
                  DrawerListTile(
                    title: 'Updates',
                    icon: update,
                    onTap: () {},
                  ),
                  DrawerListTile(
                    title: 'Rate Us',
                    icon: rating,
                    onTap: () {},
                  ),
                  DrawerListTile(
                    title: 'Privacy And Policy',
                    icon: insurance,
                    onTap: () {},
                  ),
                  DrawerListTile(
                    title: 'Terms And Conditions',
                    icon: termsCondition,
                    onTap: () {},
                  ),
                ],
              ),

              const Spacer(),
              const LogoutSection()
            ],
          ),
        ),
      );
}
