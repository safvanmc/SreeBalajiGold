import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/Product_List.dart/presentation/view/screens/product_list_screen.dart';
import 'package:sree_balagi_gold/features/home/data/models/jwelry_model.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class JewelryItemFrame extends StatelessWidget {
  final String title;
  final String image;
  final int totalItems;

  const JewelryItemFrame(
      {super.key,
      required this.title,
      required this.image,
      required this.totalItems});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductListScreen(
              title: title,
            );
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: kwhiteColor,
          // boxShadow: const [
          //   BoxShadow(
          //       blurRadius: 1,
          //       spreadRadius: 1,
          //       offset: Offset(0.0, 2.0),
          //       color: Color.fromARGB(210, 238, 238, 238))
          // ],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                height: 130,
                width: 146,
              ),
            ),
            const SizedBox(height: 8),
            Text(title,
                style:
                    appTextTheme.bodyMedium!.copyWith(color: secondaryColor)),
            Text(
              'Total: $totalItems items',
              style: appTextTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

// dummy //
final List<Jewelry> jewelryItems = [
  Jewelry(
      title: 'Necklaces',
      image:
          'https://th.bing.com/th?q=Indian+Fashion+Jewellery&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.5&pid=InlineBlock&mkt=en-XA&cc=SA&setlang=en&adlt=strict&t=1&mw=247',
      totalItems: 21),
  Jewelry(
      title: 'Anklet',
      image:
          'https://th.bing.com/th/id/OIP.z7wUzj4hAuaNqiUfwDi2vAHaLF?w=152&h=220&c=7&r=0&o=5&dpr=1.5&pid=1.7',
      totalItems: 21),
  Jewelry(
      title: 'Bangle',
      image:
          'https://th.bing.com/th/id/OIP.5MQp6yo0ek-Vl_08In7UMQAAAA?w=185&h=184&c=7&r=0&o=5&dpr=1.5&pid=1.7',
      totalItems: 21),
  Jewelry(
      title: 'Bracelet',
      image:
          'https://th.bing.com/th?q=Jewellery+Bracelets&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.5&pid=InlineBlock&mkt=en-XA&cc=SA&setlang=en&adlt=strict&t=1&mw=247',
      totalItems: 21),
  // Add more items as needed
];
