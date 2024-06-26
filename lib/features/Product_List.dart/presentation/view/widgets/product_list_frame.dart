import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/Product_List.dart/presentation/provider/third_catagory_provider.dart';
import 'package:sree_balagi_gold/features/home/data/models/jwelry_model.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/view/product_detail_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';

class ProductListFrame extends StatelessWidget {
  final String title;
  final String image;
  final int totalItems;
  final int index;
  const ProductListFrame(
      {super.key,
      required this.title,
      required this.image,
      required this.totalItems,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductDetailScreen(
              title: title,
            );
          },
        ));
      },
      child: Stack(
        children: [
          Container(
            height: 360,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    height: 280,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Serial No:  ',
                                style: appTextTheme.displaySmall!.copyWith(
                                    color:
                                        const Color.fromARGB(255, 62, 62, 62)),
                                children: [
                                  TextSpan(
                                      text: title,
                                      style: appTextTheme.displayMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              decoration: TextDecoration.none))
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Gross Weight:  ',
                                style: appTextTheme.displaySmall!.copyWith(
                                    color:
                                        const Color.fromARGB(255, 62, 62, 62),
                                    decoration: TextDecoration.none),
                                children: [
                                  TextSpan(
                                      text: title,
                                      style: appTextTheme.displayMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              decoration: TextDecoration.none))
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Net Weight:  ',
                                style: appTextTheme.displaySmall!.copyWith(
                                    color:
                                        const Color.fromARGB(255, 62, 62, 62)),
                                children: [
                                  TextSpan(
                                      text: title,
                                      style: appTextTheme.displayMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              decoration: TextDecoration.none))
                                ]),
                          ),
                        ],
                      ),
                      ElevatedCutsomBtn(
                        height: 35,
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: kwhiteColor,
                              size: 15,
                            ),
                            Text(
                              'Add',
                              style: appTextTheme.labelLarge!
                                  .copyWith(fontSize: 12),
                            )
                          ],
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Consumer<ThirdCatagoryProvider>(
              builder: (context, state, child) => IconButton.filled(
                  color: primaryColor,
                  highlightColor: kwhiteColor,
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(kwhiteColor)),
                  onPressed: () {
                    state.onPressedAFavourite(index);
                  },
                  icon: Icon(
                    state.tapedIndex == index
                        ? Icons.favorite_outlined
                        : Icons.favorite_outline_sharp,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

// dummy //
final List<Jewelry> thirdCatagory = [
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
