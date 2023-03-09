import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:admin/src/components/my_toast/my_toast.dart';
import 'package:admin/src/controllers/admin/admin_controller.dart';
import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/helper/upload_image.dart';
import 'package:admin/src/models/get_add_company_info_model.dart';
import 'package:admin/src/routes/routes.dart';
import 'package:admin/src/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AddCompanyViewModel {

  String base64Image = ""; //for convert
  TextEditingController companyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GenericCubit<File?> getImageCubit = GenericCubit();
  GenericCubit<bool> getAddCompany = GenericCubit(data: false);


  Future<void> getMyImage() async {
    UploadImage uploadImage = UploadImage();
    File? fileImage = await uploadImage.getImageByType(ImageSource.gallery);
    if (fileImage != null) {
      getImageCubit.update(data: fileImage);
      Uint8List bytes = fileImage.readAsBytesSync(); //for convert
      base64Image = base64Encode(bytes);
    }
  }

  void addCompany(String adminId) async {
    getAddCompany.update(data: true);

    GetAddCompanyInfoModel? getAddCompanyInfoModel = await AdminController.addCompany(adminId: adminId,
        companyName: companyController.text,
        companyLogo: base64Image);

    if (getAddCompanyInfoModel != null) {
      showToast(msg: getAddCompanyInfoModel.message![0].value.toString(), backgroundColor: AppColors.green);
      goToWithRemoveRoute(screenNames: ScreenNames.homeScreen );
    }
    getAddCompany.update(data: false);
  }
}
