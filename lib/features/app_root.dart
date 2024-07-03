import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/view/favorite_product_display_screen.dart';
import 'package:sree_balagi_gold/features/home/presentation/view/home_screen.dart';
import 'package:sree_balagi_gold/features/main_category/presentation/view/main_category_screen.dart';
import 'package:sree_balagi_gold/features/notification/presentation/view/notification_screen.dart';
import 'package:sree_balagi_gold/features/profile/presentation/view/profile_drawer.dart';
import 'package:sree_balagi_gold/general/service/detect_user_screenshot_action.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({
    super.key,
    this.currentIndex = 0,
  });
  final int currentIndex;
  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const MainCategoryScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
    const NotificationScreen(),
  ];
  @override
  void initState() {
    DetectUserScreenshotAction.start();
    currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryColor,
        title: Center(
          child: SizedBox(
            height: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(
                image: AssetImage(
                  AppIcons.appIcon,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              EasyNavigator.push(
                context,
                child: const FavoriteProductDisplayScreen(),
              );
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 25,
            ),
          ),
          const Gap(5),
        ],
      ),
      drawer: const Drawer(
        child: ProfileDrawer(),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          height: 2,
          color: AppColors.secondaryColor,
        ),
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.primaryColor.withOpacity(.7),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          height: 2,
          color: AppColors.primaryColor,
        ),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              color: currentIndex == 0
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
              AssetImage(
                currentIndex == 0 ? AppIcons.homeFill : AppIcons.home,
              ),
              size: 22,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              color: currentIndex == 1
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
              AssetImage(
                currentIndex == 1 ? AppIcons.categoryFill : AppIcons.category,
              ),
              size: 22,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              color: currentIndex == 2
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
              AssetImage(
                currentIndex == 2 ? AppIcons.cartFill : AppIcons.cart,
              ),
              size: 22,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              color: currentIndex == 3
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
              AssetImage(
                currentIndex == 3 ? AppIcons.myOrderFill : AppIcons.myOrder,
              ),
              size: 22,
            ),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              color: currentIndex == 4
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
              AssetImage(
                currentIndex == 4
                    ? AppIcons.notificationFill
                    : AppIcons.notification,
              ),
              size: 22,
            ),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
