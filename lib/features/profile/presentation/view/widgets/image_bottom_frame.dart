import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sree_balagi_gold/features/profile/presentation/provider/edit_profile_provider.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';

Future<dynamic> pickImageBottomSheet(
  BuildContext context,
  EditProfileProvider state,
) {
  final mq = MediaQuery.sizeOf(context);
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(top: mq.height / 1.4),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: Colors.white,
          child: Material(
            color: Colors.white,
            child: Column(
              children: [
                const Text(
                  'Pick a Profile Picture',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const Gap(20),
                CButton(
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(IconlyLight.image),
                      Gap(5),
                      Text(
                        'Choose a photo',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    state.pickprofile(context, ImageSource.gallery);
                    EasyNavigator.pop(context);
                  },
                ),
                const Gap(10),
                CButton(
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(IconlyLight.camera),
                      Gap(5),
                      Text(
                        'Take a photo',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    state.pickprofile(context, ImageSource.camera);
                    EasyNavigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      });
}
