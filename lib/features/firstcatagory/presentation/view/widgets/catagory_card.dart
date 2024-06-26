import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/home/data/models/jwelry_model.dart';
import 'package:sree_balagi_gold/features/second_catagory/presentation/view/screens/second_catagory_screen.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_cachednetwork_image.dart';

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({
    super.key,
    // required this.title,
    // required this.image,
  });
  // final String title;
  // final String image;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.88,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondCatagoryScreen(
                      title: jewelryItem[index].title,
                    ),
                  )),
              child: Container(
                // padding: const EdgeInsets.all(7),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                      child: CustomCachedNetworkImage(
                        url: jewelryItem[index].image,
                        boxFit: BoxFit.cover,
                        height: 136,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(jewelryItem[index].title,
                          style: appTextTheme.bodyMedium!
                              .copyWith(color: secondaryColor)),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: jewelryItem.length,
        ),
      ),
    );
  }
}

//dummy data//

final List<Jewelry> jewelryItem = [
  Jewelry(
      title: 'Jwellery',
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
      title: 'Mala',
      image:
          'https://th.bing.com/th?q=Jewellery+Bracelets&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.5&pid=InlineBlock&mkt=en-XA&cc=SA&setlang=en&adlt=strict&t=1&mw=247',
      totalItems: 21),
  // Add more items as needed
];
