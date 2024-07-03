import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/sub_category/data/model/sub_category_model.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';

class SubCategoryFrame extends StatelessWidget {
  const SubCategoryFrame({
    super.key,
    required this.categoryModel,
    required this.onTap,
  });
  final SubCategoryModel categoryModel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kwhiteColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                child: CNetworkImage(
                  url: categoryModel.imageUrl,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  children: [
                    const Gap(5),
                    Expanded(
                      child: Text(
                        categoryModel.name,
                        style: const TextStyle(
                          color: AppColors.secondaryColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap(2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
