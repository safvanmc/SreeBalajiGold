import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_Row.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';

class OrderFrame extends StatelessWidget {
  const OrderFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.2),
          // boxShadow: const [
          //   BoxShadow(
          //     color: AppColors.primaryColor,
          //     blurRadius: 3,
          //     offset: Offset(0, 1),
          //     spreadRadius: 0,
          //   )
          // ],
          borderRadius: BorderRadius.circular(6)),
      child: const Row(
        children: [
          CNetworkImage(
            url:
                'https://s3-alpha-sig.figma.com/img/c1e8/f360/835ab2f9e15ec87023d353b09808b4ad?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=b0IYwMH9ze5SvfovgX7ImlbSxCA9fVqtXCfGwjp99zQ7CYOXdsGtYTMC9gcTHEYuusOh322TTu5-xBdKHFlk8hCdN39H8mP3Yle~jAd6xvwMFBdDyoMYD3myjI1AQWR7JQl-bHRSsYgwF0GKr92OwsWSQyGC4STyk5M6VLUkvGU25GAfbZ7ubhjRR3qSoZneuXsnnG0tRslZ89-BfGLDF45QkllVmFkYrT5zIT2WK7t8W7M--Xpz~hmksfqNVu67zkyvBeCKFneDYikyl6HKvIaTiou1wHUof9CHF8bgjxMpD2OvD6LjTLzjeXD8-ekO4O6sQ~z6rj8ujTawApVp8Q__',
            boxFit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
          Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '#######,',
                      style: TextStyle(
                        color: Color(0xFF624C69),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                CRowWidget(keyvalue: 'Gross Weight:', widget: '${134}'),
                Gap(8),
                CRowWidget(keyvalue: 'Net Weight: ', widget: '${13313}'),
                Gap(8),
                CRowWidget(keyvalue: 'Piece: ', widget: '${244}'),
                Gap(8),
                CRowWidget(keyvalue: 'Total:', widget: '${12323}'),
                CRowWidget(keyvalue: 'Status:', widget: 'Under Work'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
