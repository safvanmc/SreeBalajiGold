import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/my_orders/data/model/my_order_model.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_Row.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';

class OrderFrame extends StatelessWidget {
  const OrderFrame({
    super.key,
    required this.data,
  });
  final MyOrderModel data;
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
      child: Row(
        children: [
          CNetworkImage(
            url: data.product.productUrl.first,
            boxFit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.product.serialNumber,
                      style: const TextStyle(
                        color: Color(0xFF624C69),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                CRowWidget(
                    keyvalue: 'Gross Weight:',
                    data: '${data.product.grossWeight}'),
                const Gap(8),
                CRowWidget(
                    keyvalue: 'Net Weight: ',
                    data: '${data.product.netWeight}'),
                const Gap(8),
                CRowWidget(keyvalue: 'Piece: ', data: '${data.product.pieces}'),
                const Gap(8),
                const CRowWidget(keyvalue: 'Total:', data: '${12323}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Status:',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      data.orderStatus == 0
                          ? 'pending'
                          : data.orderStatus == 1
                              ? 'accepted'
                              : data.orderStatus == 2
                                  ? 'deliverd'
                                  : 'rejected',
                      style: TextStyle(
                        color: data.orderStatus == 0
                            ? Colors.amber
                            : data.orderStatus == 1
                                ? Colors.blue
                                : data.orderStatus == 2
                                    ? Colors.green
                                    : Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
