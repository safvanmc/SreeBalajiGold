import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/data/i_auth_facade.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/banner/data/i_banner_facade.dart';
import 'package:sree_balagi_gold/features/banner/presentation/provider/banner_provider.dart';
import 'package:sree_balagi_gold/features/cart/data/i_cart_facade.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/i_category_product_facade.dart';
import 'package:sree_balagi_gold/features/category_product_display/presentation/provider/category_product_provider.dart';
import 'package:sree_balagi_gold/features/favorite/data/i_favorite_facade.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/provider/favorite_provider.dart';
import 'package:sree_balagi_gold/features/main_category/data/i_main_category_facade.dart';
import 'package:sree_balagi_gold/features/main_category/presentation/provider/main_category_provider.dart';
import 'package:sree_balagi_gold/features/my_orders/data/i_order_facade.dart';
import 'package:sree_balagi_gold/features/my_orders/presentation/provider/order_provider.dart';
import 'package:sree_balagi_gold/features/notification/data/i_notification_facade.dart';
import 'package:sree_balagi_gold/features/notification/presentation/provider/notification_provider.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/provider/product_detail_provider.dart';
import 'package:sree_balagi_gold/features/profile/data/i_profile_facade.dart';
import 'package:sree_balagi_gold/features/profile/presentation/provider/edit_profile_provider.dart';
import 'package:sree_balagi_gold/features/splash_screen.dart/presentation/view/splash_screen.dart';
import 'package:sree_balagi_gold/features/sub_category/data/i_sub_category_facade.dart';
import 'package:sree_balagi_gold/features/sub_category/presentation/provider/sub_category_provider.dart';
import 'package:sree_balagi_gold/general/core/di/injection.dart';
import 'package:sree_balagi_gold/general/service/firebase_messaging.dart';
import 'package:sree_balagi_gold/general/utils/app_details.dart';
import 'package:sree_balagi_gold/general/utils/app_fonts.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependancy();
  await FirebaseFCMApi().initNotification();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
            sl<IAuthFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(
            sl<INotificationFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MainCategoryProvider(
            sl<IMainCategoryFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SubCategoryProvider(
            sl<ISubCategoryFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProductProvider(
            sl<ICategoryProductFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BannerProvider(
            sl<IBannerFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(
            sl<IFavoriteFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProfileProvider(
            sl<IProfileFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(
            sl<ICartFacade>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(
            sl<IOrderFacade>(),
          ),
        ),
      ],
      child: ToastificationWrapper(
        child: MaterialApp(
          title: AppDetails.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            textTheme: appTextTheme,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: AppFonts.primaryFont,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
