import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:sree_balagi_gold/features/firstcatagory/presentation/view/screens/catagory_screen.dart';
import 'package:sree_balagi_gold/features/home/presentation/view/screens/home_screen.dart';
import 'package:sree_balagi_gold/features/my_orders/presentation/view/my_orders_screen.dart';
import 'package:sree_balagi_gold/features/notification/presentation/view/notification_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppRootProvider extends ChangeNotifier {
  int selectedindex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CatagoryScreen(),
    const CartScreen(),
    const MyOrdersScreen(),
    const NotificationScreen()
  ];
  void onchanged(value) {
    selectedindex = value;
    notifyListeners();
  }

  //whatsapp share//

  Future<void> shareToWhatsApp() async {
    final whatsappUrl = "whatsapp://send?text=${Uri.encodeComponent('Saf')}";
    try {
      await launchUrlString(whatsappUrl);
    } catch (ex) {
      log("Error In Launch:$ex");
    }
    notifyListeners();
  }

  // //drawer click event//
  // void handleItemClick(BuildContext context) {
  //   Navigator.pop(context);
  //   notifyListeners();
  // }

  // share appLink//
  Future<void> onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    // subject is optional but it will be used
    // only when sharing content over email
    await Share.share(
        'https://play.google.com/store/apps/details?id=com.strollin_affiliate',
        // subject: 'safwan',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    notifyListeners();
  }

  //make call//
  Future<void> makingPhoneCall() async {
    final url = Uri(scheme: 'tel', path: "+918111945116");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      log(url.toString());
      notifyListeners();
    } else {
      throw 'Could not launch $url';
    }
  }
}
