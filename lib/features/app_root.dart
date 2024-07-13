import 'dart:developer';

import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/cart_screen.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/view/favorite_product_display_screen.dart';
import 'package:sree_balagi_gold/features/home/presentation/view/home_screen.dart';
import 'package:sree_balagi_gold/features/main_category/presentation/view/main_category_screen.dart';
import 'package:sree_balagi_gold/features/my_orders/presentation/view/my_orders_screen.dart';
import 'package:sree_balagi_gold/features/notification/presentation/provider/notification_provider.dart';
import 'package:sree_balagi_gold/features/notification/presentation/view/notification_screen.dart';
import 'package:sree_balagi_gold/features/profile/presentation/view/profile_drawer.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/service/firebase_messaging.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_details.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

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
    const CartScreen(),
    const MyOrdersScreen(),
    const NotificationScreen(),
  ];

  // static const platform = MethodChannel('screenshot_channel');
  setSecure() async {
    await ScreenProtector.protectDataLeakageOn();
  }

  @override
  void initState() {
    // platform.setMethodCallHandler(_handleMethod);
    // _startListening();
    setSecure();     
    currentIndex = widget.currentIndex;
    //when background mssg taped//
    FirebaseFCMApi().tapFcmMessage(
      (message) {
        if (message?.data['key'] == 'notification') {
          currentIndex = 4;
          setState(() {});
        }
      },
    );
    FirebaseFCMApi().initLocalNotification(
      () async {
        log('set');
        await context.read<NotificationProvider>().isRefreshorNot(true);
        currentIndex = 4;
        setState(() {});
      },
    );
    super.initState();
  }

  // bool isScreenshoted = false;
  // Future<void> _handleMethod(MethodCall call) async {
  //   screenshotController.capture();
  //   switch (call.method) {
  //     case 'screenshotDetected':
  //       if (isScreenshoted) return;

  //       isScreenshoted = true;
  //       log('screenshoted');
  //       break;
  //     default:
  //       throw MissingPluginException('notImplemented');
  //   }
  // }

  // Future<void> _startListening() async {
  //   try {
  //     await platform.invokeMethod('startListening');
  //   } on PlatformException catch (e) {
  //     print("Failed to start listening: '${e.message}'.");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      drawer: Drawer(
        child: ProfileDrawer(
          switchMyOrders: () {
            EasyNavigator.pop(context);
            setState(() {
              currentIndex = 3;
            });
          },
        ),
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
      floatingActionButton:
          currentIndex == 0 ? const CustomFloatingBtn() : null,
    );
  }
}

class CustomFloatingBtn extends StatelessWidget {
  const CustomFloatingBtn({
    super.key,
  });

  get kwhiteColor => null;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      highlightElevation: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: const CircleBorder(),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: kwhiteColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            titlePadding: const EdgeInsets.only(top: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            title: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.whatsapp,
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      'Whatsapp Now',
                      textAlign: TextAlign.center,
                      style: appTextTheme.bodyMedium!
                          .copyWith(color: Colors.black),
                    )
                  ],
                ),
                Positioned(
                    right: 5,
                    bottom: -10,
                    child: IconButton(
                        style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        splashColor: Colors.transparent,
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 20,
                          color: Colors.black,
                        )))
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      AppDetails.whatsappNumber,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  titleTextStyle: appTextTheme.displayMedium!.copyWith(
                      fontSize: 12,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                  minTileHeight: 60,
                  onTap: () {
                    EasyLauncher.sendToWhatsApp(
                        phone: AppDetails.whatsappNumber);
                  },
                )
              ],
            ),
          ),
        );
      },
      child: Image.asset(
        AppIcons.whatsapp,
        fit: BoxFit.cover,
      ),
    );
  }
}
