import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/whishlist/presentation/view/wishlist_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: primaryColor,
      leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: ImageIcon(
            AssetImage(drawer),
            size: 40,
            color: kwhiteColor,
          )),
      centerTitle: true,
      title: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover)),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WishlistScreen(),
                  ));
            },
            icon: const Icon(
              Icons.favorite_border_sharp,
              color: kwhiteColor,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
