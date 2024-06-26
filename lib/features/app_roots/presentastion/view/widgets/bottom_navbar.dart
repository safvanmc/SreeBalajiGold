import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/provider/app_root_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppRootProvider>(
      builder: (context, state, child) => Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(color: kwhiteColor, boxShadow: [
            BoxShadow(
                blurRadius: 3, spreadRadius: 1, color: Colors.grey.shade300)
          ]),
          child: BottomNavigationBar(
            backgroundColor: kwhiteColor,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (value) => state.onchanged(value),
            // fixedColor: kwhiteColor,
            currentIndex: state.selectedindex,
            iconSize: 20,

            unselectedItemColor: primaryColor,
            selectedItemColor: secondaryColor,

            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(
              color: Color(0xFF624C69),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 2,
            ),
            selectedLabelStyle: const TextStyle(
              color: Color(0xFF624C69),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 2,
            ),

            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      home2,
                    ),
                  ),
                  activeIcon: ImageIcon(AssetImage(home)),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    catagory,
                  )),
                  activeIcon: ImageIcon(AssetImage(catagory2)),
                  label: 'Catagory'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(cart)),
                  activeIcon: ImageIcon(AssetImage(cart2)),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    myorder,
                  )),
                  activeIcon: ImageIcon(AssetImage(myorder2)),
                  label: 'My Orders'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      bell,
                    ),
                  ),
                  activeIcon: ImageIcon(AssetImage(bell2)),
                  label: 'Notifications'),
            ],
          ),
        ),
      ),
    );
  }
}
