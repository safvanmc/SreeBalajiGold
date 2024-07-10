// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sree_balagi_gold/general/core/di/injection.dart';
import 'package:sree_balagi_gold/general/widgets/custom_toast.dart';

class ImagePick {
  static final _imagePicker = sl<ImagePicker>();

  static Future<String?> pickImage(
      {required BuildContext context, required ImageSource source}) async {
    try {
      log('0');
      final pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile == null) return null;
      log('1');
      // Get the file
      return pickedFile.path;
      // Check file size
    } catch (e) {
      log(e.toString());
      CToast.error(msg: e.toString());
    }
    return null;
  }
}
