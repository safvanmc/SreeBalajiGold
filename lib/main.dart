import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/Product_List.dart/presentation/provider/third_catagory_provider.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/provider/app_root_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/home/presentation/provider/home_provider.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/provider/product_detail_provider.dart';
import 'package:sree_balagi_gold/features/splash_screen.dart/presentation/view/splash_screen.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppRootProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThirdCatagoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewprovider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: appTextTheme,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Axiforma',
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
