import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/button/button.dart';
import '../../components/text/custom_text.dart';
import '../../components/text_field/text_field_custom.dart';
import '../../helper/validation.dart';
import '../../routes/routes.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';
import 'add_department_view_model.dart';

class AddDepartmentScreen extends StatelessWidget {
  final AddDepartmenentViewModel addDepartmenentViewModel = AddDepartmenentViewModel();

  AddDepartmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppWords.add_departments,
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
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: addDepartmenentViewModel.formKey,
            child: Column(
              children: [
                BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                  bloc: addDepartmenentViewModel.getImage,
                  listener: (context, state) {},
                  builder: (context, state) {
                    return addDepartmenentViewModel.image == null ? InkWell(
                      onTap: () {
                        addDepartmenentViewModel.getMyImage();
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
                            image: FileImage(
                                addDepartmenentViewModel.image!),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                    controller: addDepartmenentViewModel.deptController,
                    inputType: TextInputType.text,
                    labelText: '',
                    hintText: AppWords.departments_name,
                    textFieldVaidType:
                    TextFieldvalidatorType.DisplayText),
                SizedBox(
                  height: 25.h,
                ),
                CustomButton(
                  width: 0.7.sw,
                  text: AppWords.add_departments,
                  onPressed: () {
                    if (addDepartmenentViewModel.formKey.currentState!.validate()) {

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
