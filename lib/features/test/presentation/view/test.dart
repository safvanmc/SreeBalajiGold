// import 'package:easy_debounce/easy_debounce.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:gap/gap.dart';
// import 'package:onspot_admin/features/job_category/presentation/view/category_upload_dialogue.dart';
// import 'package:onspot_admin/generals/widgets/cutom_material_buttton.dart';
// import 'package:provider/provider.dart';
// import 'package:onspot_admin/features/app_root/presentation/view/widget/custom_appbar.dart';
// import 'package:onspot_admin/features/job_category/presentation/provider/job_category_provider.dart';
// import 'package:onspot_admin/generals/utils/app_colors.dart';
// import 'package:onspot_admin/generals/widgets/custom_button.dart';

// class JobCategoryScreen extends StatefulWidget {
//   const JobCategoryScreen({super.key});

//   @override
//   State<JobCategoryScreen> createState() => _JobCategoryScreenState();
// }

// class _JobCategoryScreenState extends State<JobCategoryScreen> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<JobCategoryProvider>().getCategoryList(context);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<JobCategoryProvider>(
//       builder: (context, categoryProvider, child) {
//         return Column(
//           children: [
//             CustomAppBar(
//               searchController: categoryProvider.searchcontroller,
//               onChanged: (value) {
//                 EasyDebounce.debounce(
//                   'search',
//                   const Duration(milliseconds: 500),
//                   () {
//                     categoryProvider.searchCategory(
//                       context: context,
//                       query: value,
//                     );
//                   },
//                 );
//               },
//             ),
//             Expanded(
//               child: CustomScrollView(
//                 slivers: [
//                   SliverPadding(
//                     padding: EdgeInsets.only(top: 5),
//                     sliver: SliverAppBar(
//                       elevation: 2,
//                       surfaceTintColor: Colors.white,
//                       backgroundColor: Colors.white,
//                       pinned: true,
//                       title: Column(
//                         children: [
//                           const Gap(5),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Padding(
//                                 padding: EdgeInsets.only(left: 12, right: 10),
//                                 child: Text(
//                                   'Job Category',
//                                   style: TextStyle(
//                                     color: AppColors.primary,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 10),
//                                 child: CustomButton(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 25, vertical: 10),
//                                   onPress: () {
//                                     categoryUploadDialog(context);
//                                   },
//                                   color: AppColors.buttoncolor,
//                                   widget: const Text(
//                                     "Add new Category",
//                                     style: TextStyle(color: AppColors.white),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SliverToBoxAdapter(child: Gap(10)),
//                   SliverPadding(
//                     padding: const EdgeInsets.all(12.0),
//                     sliver: Consumer<JobCategoryProvider>(
//                       builder: (context, categoryProvider, _) {
//                         if (categoryProvider.isLoading &&
//                             categoryProvider.categoryList.isEmpty) {
//                           return const SliverToBoxAdapter(
//                             child: Center(child: CircularProgressIndicator()),
//                           );
//                         }
//                         return SliverList.builder(
//                           itemCount: categoryProvider.categoryList.length,
//                           itemBuilder: (context, index) {
//                             final data = categoryProvider.categoryList[index];
//                             return Column(
//                               children: [
//                                 SizedBox(
//                                   width: 1200,
//                                   child: Container(
//                                     margin: const EdgeInsets.only(bottom: 10.0),
//                                     height: 50,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.textformColor),
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 10.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             data.title ?? '',
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           Row(
//                                             children: [
//                                               CustomMaterialButton(
//                                                 widget: const Text(
//                                                   "Edit",
//                                                   style: TextStyle(
//                                                     color: AppColors.white,
//                                                   ),
//                                                 ),
//                                                 height: 20,
//                                                 minWidth: 10,
//                                                 color: AppColors.primary,
//                                                 onTap: () async {
//                                                   await categoryUploadDialog(
//                                                     context,
//                                                     initialName: data.title,
//                                                     categoryId: data.id,
//                                                   );
//                                                 },
//                                               ),
//                                               const Gap(5),
//                                               CustomMaterialButton(
//                                                 widget: const Text("Delete",
//                                                     style: TextStyle(
//                                                       color: AppColors.white,
//                                                     )),
//                                                 height: 20,
//                                                 minWidth: 10,
//                                                 color: Colors.red,
//                                                 onTap: () {
//                                                   categoryProvider
//                                                       .deleteCategory(
//                                                     context,
//                                                     data.id!,
//                                                   );
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   SliverToBoxAdapter(
//                     child: categoryProvider.isMoreData &&
//                             categoryProvider.categoryList.isNotEmpty
//                         ? Padding(
//                             padding: const EdgeInsets.only(bottom: 20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CustomMaterialButton(
//                                   widget: categoryProvider.isLoading
//                                       ? const CupertinoActivityIndicator()
//                                       : const Text(
//                                           "Load More",
//                                           style: TextStyle(
//                                             color: AppColors.white,
//                                           ),
//                                         ),
//                                   textColor: AppColors.white,
//                                   color: AppColors.buttoncolor,
//                                   onTap: () {
//                                     if (categoryProvider.isLoading) return;
//                                     categoryProvider.getCategoryList(context);
//                                   },
                                
//                                 ),
//                               ],
//                             ),
//                           )
//                         : null,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }