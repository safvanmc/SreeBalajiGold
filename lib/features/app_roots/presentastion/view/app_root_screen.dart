import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/provider/app_root_provider.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/widgets/bottom_navbar.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/widgets/custom_app_bar.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/widgets/drawer.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/widgets/floating_botton.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

class AppRootScreen extends StatefulWidget {
  const AppRootScreen({super.key, required this.index});
  final int index;
  @override
  State<AppRootScreen> createState() => _AppRootScreenState();
}

class _AppRootScreenState extends State<AppRootScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<AppRootProvider>(context, listen: false)
            .onchanged(widget.index);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppRootProvider>(
      builder: (context, state, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: kwhiteColor,
        drawer: const NavDrawerWidget(),
        appBar: const CustomAppBar(),
        body: Center(child: state.screens.elementAt(state.selectedindex)),
        floatingActionButton: state.selectedindex == 0
            ? const CustomFloatingBtn()
            : const SizedBox.shrink(),
        bottomNavigationBar: const CustomNavBar(),
      ),
    );
  }
}
