import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/materialdetails_tabview.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class MaterialDetailFrame extends StatelessWidget {
  const MaterialDetailFrame({
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
          Expanded(
            child: ListView.builder(
              itemCount: productModel.materials.length,
              itemBuilder: (context, index) {
                final material = productModel.materials[index];
                return Column(
                  children: [
                    MaterialDetailRow(
                      style: appTextTheme.displaySmall,
                      type: material.type,
                      piece: '${material.materialPieces}',
                      weight: '${material.weight}',
                      total: '${material.total}',
                    ),
                    const Divider(),
                    const Gap(5),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
