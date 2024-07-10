import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/profile/data/i_profile_facade.dart';
import 'package:sree_balagi_gold/general/service/image_pick.dart';
import 'package:sree_balagi_gold/general/service/image_upload_service.dart';
import 'package:sree_balagi_gold/general/service/keywords_builder.dart';
import 'package:sree_balagi_gold/general/widgets/custom_toast.dart';

class EditProfileProvider extends ChangeNotifier {
  final IProfileFacade iProfileFacde;
  EditProfileProvider(this.iProfileFacde);
  String? oldImageUrl;
  String? newImageUrl;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController shopName = TextEditingController();
  TextEditingController shopAddress = TextEditingController();

  Future<void> pickprofile(
    BuildContext context,
    ImageSource source,
  ) async {
    final image = await ImagePick.pickImage(
      context: context,
      source: source,
    );
    if (image == null) return;
    newImageUrl = image;

    notifyListeners();
  }

  Future<void> updateProfile(
    BuildContext context,
  ) async {
    final userdata = context.read<AuthProvider>().userModel;
    if (oldImageUrl != null && newImageUrl != null) {
      ImageUploadServices.deleteFirebaseStorageFile(context, [oldImageUrl!]);
    }
    if (newImageUrl != null) {
      final result = await ImageUploadServices.uploadListImageStorage(
          compressSize: const Size(500, 500),
          imgFolderName: 'profile',
          fileList: [XFile(newImageUrl!)]);

      result.fold(
        (e) {
          CToast.error(msg: e.msg);
          return;
        },
        (succus) async {
          oldImageUrl = succus.first;
          newImageUrl = null;
          notifyListeners();
          log('Save Image successfully');
        },
      );
    }

    final result = await iProfileFacde.updateProfile(
      UserModel(
        id: userdata!.id,
        name: name.text,
        shopName: shopName.text,
        shopAddress: shopAddress.text,
        photoUrl: oldImageUrl,
        phoneNumber: phone.text,
        nameKeyword: KeywordsBuilder.advanceKeywordsBuilder(
          name.text.trim(),
        ),
        shopNameKeyword: KeywordsBuilder.advanceKeywordsBuilder(
          shopName.text.trim(),
        ),
        isBlocked: userdata.isBlocked,
        favorites: userdata.favorites,
      ),
    );
    result.fold(
      (l) {
        CToast.error(msg: l.msg);
      },
      (r) {
        CToast.success(msg: 'Profile Saved Successfully');
      },
    );
  }
}
