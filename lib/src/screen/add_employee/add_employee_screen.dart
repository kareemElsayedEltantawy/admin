import 'package:admin/src/screen/add_employee/add_employee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/button/button.dart';
import '../../components/text/custom_text.dart';
import '../../components/text_field/text_field_custom.dart';
import '../../helper/validation.dart';
import '../../routes/routes.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';



class AddEmployeeScreen extends StatelessWidget {
  final AddEmployeeViewModel addEmployeeViewModel = AddEmployeeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppWords.add_employee,
            color: AppColors.black,
            fontSize: 16.sp,
            fontFamily: AppFonts.fontBold),
        leading: IconButton(
            onPressed: () {
              goBack();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Padding(
          padding: EdgeInsets.all(14.0.sp),
          child: SingleChildScrollView(
            child: Form(
              key: addEmployeeViewModel.formKey,
              child: Column(
                children: [
                  CustomText(
                      text: LLogin.welcome,
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontFamily: AppFonts.fontBold),

                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                    controller: addEmployeeViewModel.userNameController,
                    hintText: LLogin.user_name,
                    labelText: '',
                    inputType: TextInputType.name,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                  ),
                  CustomTextField(
                    controller: addEmployeeViewModel.nameController,
                    hintText: LLogin.name,
                    labelText: '',
                    inputType: TextInputType.name,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                  ),
                  CustomTextField(
                      controller: addEmployeeViewModel.emailController,
                      inputType: TextInputType.emailAddress,
                      labelText: '',
                      hintText: LLogin.email,
                      textFieldVaidType: TextFieldvalidatorType.Email),
                  CustomTextField(
                    controller: addEmployeeViewModel.passwordController,
                    hintText: LLogin.password,
                    labelText: '',
                    obscureText: true,
                    inputType: TextInputType.visiblePassword,
                    textFieldVaidType: TextFieldvalidatorType.Password,
                  ),
                  CustomTextField(
                    controller: addEmployeeViewModel.accessController,
                    hintText: AppWords.access,
                    labelText: '',
                    inputType: TextInputType.text,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                    onTap: (){
                      showDialog(context: context,
                          builder: (context) => SimpleDialog(
                            title: Text('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'),
                            contentPadding: EdgeInsets.all(12.sp),
                            children: [
                              Text('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'),
                              Text('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'),
                            ],
                          ));
                    },
                  ),
                  CustomTextField(
                    controller: addEmployeeViewModel.departmentController,
                    hintText: AppWords.depatment,
                    labelText: '',
                    inputType: TextInputType.text,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    fontSize: 14.sp,
                    color: AppColors.mainColor,
                    text: AppWords.add_employee,
                    onPressed: () {
                      if (addEmployeeViewModel.formKey.currentState!.validate()) {
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
