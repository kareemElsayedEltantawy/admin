import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubits/generic_cubit/generic_cubit.dart';

class AddDepartmenentViewModel{
TextEditingController deptController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

GenericCubit<bool> getImage = GenericCubit(data: false);

var picker = ImagePicker();
File? image;  //rename this variable as you like(dont forget installing image_picker package, and import 'dart:io')
Future<void> getMyImage() async {  //rename this function  as you like
  final pickedFile = await picker.getImage(
    source: ImageSource.gallery,
  );
  if (pickedFile != null) {
    image = File(pickedFile.path); //rename the variable image the same name you named above
    getImage.update(data: true);
  } else {
    getImage.update(data: true);
  }
}
}