import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UploadImage {
  Future<File?> getImageByType(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile =
        await picker.pickImage(source: imageSource, imageQuality: 50);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
