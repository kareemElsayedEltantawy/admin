import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/utility/all_app_words.dart';
import 'package:flutter/material.dart';

class EmployeeProfileViewModel{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController accessController = TextEditingController();

  GenericCubit<String> access = GenericCubit(data: AppWords.alert1);

  void chooseAccess(String val){
    access.update(data: val);
  }

}