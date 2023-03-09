import 'package:admin/src/components/button/button.dart';
import 'package:admin/src/components/custom_radio_option/custom_radio_option.dart';
import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/screen/profile/employee_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/text/custom_text.dart';
import '../../components/text_field/text_field_custom.dart';
import '../../helper/validation.dart';
import '../../routes/routes.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';

class EmployeeProfileScreen extends StatelessWidget {
  final EmployeeProfileViewModel employeeprofileViewModel =
      EmployeeProfileViewModel();

  EmployeeProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppWords.employee_details,
            color: AppColors.black,
            fontSize: 16.sp,
            fontFamily: AppFonts.fontBold),
        leading: IconButton(
            onPressed: () {
              goBack();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 54.r,
                  backgroundImage: const AssetImage(
                    AppImage.splash,
                    package: 'admin',
                  ),
                ),
              ), //k
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                  controller: employeeprofileViewModel.nameController,
                  inputType: TextInputType.name,
                  labelText: '',
                  hintText: LLogin.name,
                  textFieldVaidType: TextFieldvalidatorType.Name),
              CustomTextField(
                  controller: employeeprofileViewModel.emailController,
                  inputType: TextInputType.emailAddress,
                  labelText: '',
                  hintText: LLogin.email,
                  textFieldVaidType: TextFieldvalidatorType.Email),
              CustomTextField(
                  controller: employeeprofileViewModel.phoneController,
                  inputType: TextInputType.phone,
                  labelText: '',
                  hintText: LLogin.phone,
                  textFieldVaidType: TextFieldvalidatorType.Number),
              CustomTextField(
                  controller: employeeprofileViewModel.accessController,
                  inputType: TextInputType.text,
                  labelText: '',
                  hintText: LLogin.access,
                  textFieldVaidType: TextFieldvalidatorType.DisplayText),
              SizedBox(
                height: 15.h,
              ), //k
              CustomButton(
                width: 0.7.sw,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                            title: CustomText(
                                text: AppWords.alert,
                                color: AppColors.mainColor,
                                fontSize: 16.sp,
                                fontFamily: AppFonts.fontBold),
                            contentPadding: EdgeInsets.all(12.sp),
                            children: [
                              BlocConsumer<GenericCubit<String>, GenericState<String>>(
                                bloc: employeeprofileViewModel.access,
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: CustomRadioOption<String>(  //lAn el value ely taht String
                                                value: AppWords.alert1,
                                                groupValue: state.data!,
                                                labelWidget: CustomText(
                                                    text: AppWords.alert1,
                                                    color: AppColors.black.withOpacity(.2),
                                                    fontSize: 14.sp,
                                                    fontFamily: AppFonts.fontLight),
                                                onChanged: (value) {
                                                  employeeprofileViewModel.chooseAccess(value);
//                                                employeeprofileViewModel.access.update(data: value);
                                                }),
                                          ),
                                          Expanded(
                                            child: CustomRadioOption<String>(  // lAn el value ely taht String
                                                value: AppWords.alert2,
                                                groupValue: state.data!,
                                                labelWidget: CustomText(
                                                    text: AppWords.alert2,
                                                    color: AppColors.black.withOpacity(.2),
                                                    fontSize: 14.sp,
                                                    fontFamily: AppFonts.fontLight),
                                                onChanged: (value) {
                                                  employeeprofileViewModel.chooseAccess(value);
                                                }),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15.h,),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: CustomRadioOption<String>(  // lAn el value ely taht String
                                                value: AppWords.alert3,
                                                groupValue: state.data!,
                                                labelWidget: CustomText(
                                                    text: AppWords.alert3,
                                                    color: AppColors.black.withOpacity(.2),
                                                    fontSize: 14.sp,
                                                    fontFamily: AppFonts.fontLight),
                                                onChanged: (value) {
                                                  employeeprofileViewModel.chooseAccess(value);
                                                }),
                                          ),
                                          Expanded(
                                            child: CustomRadioOption<String>(  // lAn el value ely taht String
                                                value: AppWords.alert4,
                                                groupValue: state.data!,
                                                labelWidget: CustomText(
                                                    text: AppWords.alert4,
                                                    color: AppColors.black.withOpacity(.2),
                                                    fontSize: 14.sp,
                                                    fontFamily: AppFonts.fontLight),
                                                onChanged: (value) {
                                                  employeeprofileViewModel.chooseAccess(value);
                                                }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              )
                            ],
                          ));
                },
                text: LLogin.edit_access,
                color: AppColors.mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
