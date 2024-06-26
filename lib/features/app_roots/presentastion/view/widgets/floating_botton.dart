import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/app_roots/presentastion/view/widgets/sub%20widgets/dialog_listtile_frame.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_images.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class CustomFloatingBtn extends StatelessWidget {
  const CustomFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      highlightElevation: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: const CircleBorder(),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: kwhiteColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            titlePadding: const EdgeInsets.only(top: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            title: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      whatsapp,
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      'Whatsapp Now',
                      textAlign: TextAlign.center,
                      style: appTextTheme.bodyMedium!
                          .copyWith(color: Colors.black),
                    )
                  ],
                ),
                Positioned(
                    right: 5,
                    bottom: -10,
                    child: IconButton(
                        style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        splashColor: Colors.transparent,
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 20,
                          color: Colors.black,
                        )))
              ],
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DialogListTileFrame(
                  name: 'name one',
                  phone: '987654321',
                ),
                Divider(),
                DialogListTileFrame(name: 'name 2', phone: '9876543256')
              ],
            ),
          ),
        );
      },
      child: Image.asset(
        whatsapp,
        fit: BoxFit.cover,
      ),
    );
  }
}
