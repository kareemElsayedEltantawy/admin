import 'dart:convert';
import 'dart:io';
import 'package:admin/src/components/my_toast/my_toast.dart';
import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/helper/helper.dart';
import 'package:admin/src/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/add_company_model.dart';
import '../../routes/routes.dart';

class AddCompanyViewModel{
  TextEditingController companyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GenericCubit<bool> getImage = GenericCubit(data: false);

  var picker = ImagePicker();
  String? base64Image;//for convert
  File? image;  //rename this variable as you like(dont forget installing image_picker package in pubspec, and import 'dart:io')
  Future<void> getMyImage() async {  //rename this function  as you like
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path); //rename the variable image the same name you named above
      final bytes = File(pickedFile.path).readAsBytesSync();//for convert
      base64Image = base64Encode(bytes);//for convert
      getImage.update(data: true);
    } else {
      getImage.update(data: true);
    }
  }

  GenericCubit<bool> getAddCompany = GenericCubit(data: false);

  AddCompanyModel? addCompanyModel;
  void addCompany(String adminId){
    getAddCompany.update(data: true);
    Helper.postData(
        url: 'Company/AddCompany',
        data: {
      'Name':companyController.text,
      'Logo':base64Image,
    }, query: {'AdminId' : adminId}
      ).then((value){
      getAddCompany.update(data: false);
      goToScreen(screenNames: ScreenNames.homeScreen);
    }).catchError((error){
      showToast(msg: '${error.toString()}', backgroundColor: AppColors.red);
      getAddCompany.update(data: false);
    });
  }

}