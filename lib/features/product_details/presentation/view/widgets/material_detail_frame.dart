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
            stoneType: 'Stone \nType',
            stoneName: 'Stone \nName',
            piece: 'Piece',
            weight: 'Weight(g)',
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
                      stoneType: material.stoneType,
                      piece: '${material.materialPieces}',
                      weight: '${material.weight}',
                      stoneName: material.stoneName,
                      child: Text(
                          '${material.isKarat ? material.weight * .2 : material.weight}'),
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
