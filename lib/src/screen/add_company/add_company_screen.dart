import 'package:admin/src/components/text/custom_text.dart';
import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/utility/all_app_words.dart';
import 'package:admin/src/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/button/button.dart';
import '../../components/text_field/text_field_custom.dart';
import '../../helper/validation.dart';
import '../../routes/routes.dart';
import 'add_company_view_model.dart';

class AddCompanyScreen extends StatelessWidget {
  final AddCompanyViewModel addCompanyViewModel = AddCompanyViewModel();

  AddCompanyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppWords.add_company,
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
        padding: EdgeInsets.all(12.sp),
        child: SingleChildScrollView(
          child: Form(
            key: addCompanyViewModel.formKey,
            child: Column(
              children: [
                BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                  bloc: addCompanyViewModel.getImage,
                  listener: (context, state) {},
                  builder: (context, state) {
                    return  addCompanyViewModel.image == null ? InkWell(
                      onTap: () {
                        addCompanyViewModel.getMyImage();
                      },
                      child: Container(
                        width: 1.sw,
                        height: 0.23.sh,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.GreyColor,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: SvgPicture.asset(
                                AppImage.add_photo,package: 'admin',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                            CustomText(
                                text: AppWords.add_photo,
                                color: AppColors.grey,
                                fontSize: 14.sp,
                                fontFamily: AppFonts.fontMedium)
                          ],
                        ),
                      ),
                    ) : Container(
                      width: 1.sw,
                      height: 0.23.sh,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image: DecorationImage(
                            image: FileImage(addCompanyViewModel.image!),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                    controller: addCompanyViewModel.companyController,
                    inputType: TextInputType.text,
                    labelText: '',
                    hintText: AppWords.company_name,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText),
                SizedBox(
                  height: 25.h,
                ),
                CustomButton(
                  width: 0.7.sw,
                  text: AppWords.add_company,
                  onPressed: () {
                    if (addCompanyViewModel.formKey.currentState!.validate()) {
                      goToScreen(screenNames: ScreenNames.homeScreen);
                    }
                  },
                  color: AppColors.mainColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
