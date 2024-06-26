import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/view/widgets/materialdetails_tabview.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class MaterialDetailFrame extends StatelessWidget {
  const MaterialDetailFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Gap(5),
          MaterialDetailRow(
            style: appTextTheme.displayMedium!
                .copyWith(color: Colors.black, decoration: TextDecoration.none),
            type: 'Type',
            piece: 'Piece',
            weight: 'Weight',
            total: 'Total',
          ),
          const Divider(),
          const Gap(5),
          MaterialDetailRow(
            style: appTextTheme.displaySmall,
            type: 'Type',
            piece: 'Piece',
            weight: 'Weight',
            total: 'Total',
          ),
          const Divider(),
          const Gap(5),
          MaterialDetailRow(
            style: appTextTheme.displaySmall,
            type: 'Type',
            piece: 'Piece',
            weight: 'Weight',
            total: 'Total',
          ),
          const Divider(),
          const Gap(5),
          MaterialDetailRow(
            style: appTextTheme.displaySmall,
            type: 'Type',
            piece: 'Piece',
            weight: 'Weight',
            total: 'Total',
          ),
          const Divider(),
          const Gap(5),
          MaterialDetailRow(
            style: appTextTheme.displaySmall,
            type: 'Type',
            piece: 'Piece',
            weight: 'Weight',
            total: 'Total',
          ),
          const Divider()
        ],
      ),
    );
  }
}
