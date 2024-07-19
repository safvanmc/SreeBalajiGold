import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class ProductDetailTabView extends StatelessWidget {
  const ProductDetailTabView({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Gap(5),
          ProductDetailTile(
            data: 'Serial No',
            value: productModel.serialNumber,
          ),
          const Divider(),
          const Gap(5),
          ProductDetailTile(
            data: 'Gross Weight(g)',
            value: '${productModel.grossWeight}',
          ),
          const Divider(),
          const Gap(5),
          ProductDetailTile(
            data: 'Net Weight(g)',
            value: '${productModel.netWeight}',
          ),
          const Divider(),
          const Gap(5),
          ProductDetailTile(
            data: 'Pieces',
            value: '${productModel.pieces}',
          ),
          const Divider(),
          const Gap(5),
        ],
      ),
    );
  }
}

class ProductDetailTile extends StatelessWidget {
  const ProductDetailTile({
    super.key,
    required this.data,
    required this.value,
  });
  final String data;
  final String value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 50,
      horizontalTitleGap: 120,
      leading: Text(data),
      minLeadingWidth: 100,
      leadingAndTrailingTextStyle: appTextTheme.labelSmall!.copyWith(
          fontSize: 13, color: const Color.fromARGB(255, 102, 102, 102)),
      title: Text(value),
      titleTextStyle: appTextTheme.displayMedium!.copyWith(
        color: Colors.black,
      ),
    );
  }
}
