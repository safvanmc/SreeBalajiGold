import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppInjection {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
  // ignore: invalid_annotation_target
  // @preResolve
  // Future<SharedPreferences> get spref async =>
  //     await SharedPreferences.getInstance();
}
