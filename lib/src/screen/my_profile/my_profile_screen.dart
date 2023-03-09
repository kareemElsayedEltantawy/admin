import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/screen/my_profile/my_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/button/button.dart';
import '../../components/text/custom_text.dart';
import '../../components/text_field/text_field_custom.dart';
import '../../helper/validation.dart';
import '../../routes/routes.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';

class MyProfileScreen extends StatelessWidget {
  final MyProfileVierModel myProfileVierModel = MyProfileVierModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppWords.edit_profile,
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
          child: Form(
            key: myProfileVierModel.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                InkWell(
                  onTap: () {
                    myProfileVierModel.getMyImage();
                  },
                  child: Center(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                          bloc: myProfileVierModel.getImage,
                          listener: (context, state) {},
                          builder: (context, state) {
                            return myProfileVierModel.image == null ?  CircleAvatar(
                              radius: 54.r,
                              backgroundImage: const AssetImage(
                                AppImage.splash,
                                package: 'admin',
                              ),
                            ) : CircleAvatar(
                              radius: 54.r,
                              backgroundImage: FileImage(myProfileVierModel.image!),
                            );
                          },
                        ),
                        CircleAvatar(
                          radius: 54.r,
                          backgroundColor: AppColors.black.withOpacity(0.6),
                          child: Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  AppImage.photo,
                                  package: 'admin',
                                  width: 20.w,
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                    text: AppWords.add_profile_photo,
                                    color: AppColors.white,
                                    fontSize: 9.sp,
                                    fontFamily: AppFonts.fontLight)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ), //k
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField(
                    controller: myProfileVierModel.nameController,
                    inputType: TextInputType.name,
                    labelText: '',
                    hintText: LLogin.name,
                    textFieldVaidType: TextFieldvalidatorType.Name),
                CustomTextField(
                    controller: myProfileVierModel.companyController,
                    inputType: TextInputType.text,
                    labelText: '',
                    hintText: LLogin.company,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText),
                CustomTextField(
                    controller: myProfileVierModel.jobController,
                    inputType: TextInputType.text,
                    labelText: '',
                    hintText: LLogin.job,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText),

                SizedBox(
                  height: 15.h,
                ), //k
                CustomButton(
                  width: 0.7.sw,
                  onPressed: () {
                    if (myProfileVierModel.formKey.currentState!.validate()) {}
                  },
                  text: LLogin.edit_photo,
                  color: AppColors.mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
