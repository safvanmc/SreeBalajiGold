// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:provider/provider.dart';
// import 'package:sree_balagi_gold/features/product_datail_page/presentation/provider/product_detail_provider.dart';
// import 'package:sree_balagi_gold/general/utils/app_color.dart';
// import 'package:sree_balagi_gold/general/utils/text_style.dart';
// import 'package:sree_balagi_gold/general/widgets/custom_elevated_btn.dart';

// class BottomCartButton extends StatelessWidget {
//   const BottomCartButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductDetailProvider>(
//       builder: (context, state, child) => ColoredBox(
//         color: kwhiteColor,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: ElevatedCutsomBtn(
//             onPressed: () {
//               state.addToCart();
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(
//                   !state.addCart
//                       ? Icons.shopping_cart_outlined
//                       : CupertinoIcons.delete,
//                   color: kwhiteColor,
//                   size: 18,
//                 ),
//                 const Gap(2),
//                 Text(
//                   !state.addCart ? 'Add to Cart' : 'Remove from Cart',
//                   style: appTextTheme.labelLarge,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
