import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/text/custom_text.dart';
import '../../../models/company_model.dart';
import '../../../routes/routes.dart';
import '../../../utility/all_app_words.dart';
import '../../../utility/app_theme.dart';

class EmployeeItem extends StatelessWidget {
  final ApplicationUsers model;
  const EmployeeItem({super.key,required this.model});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToScreen(screenNames: ScreenNames.employeeProfileScreen);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 62.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
//              image: const DecorationImage(image: AssetImage(AppImage.splash , package: 'admin'),fit: BoxFit.cover),
              image:  DecorationImage(image: NetworkImage(model.image!),fit: BoxFit.cover),
            ),
          ),
          CustomText(text: model.name!,
              color: AppColors.black, fontSize: 12.sp,
              fontFamily: AppFonts.fontMedium),
          CustomText(text: model.email!,
              color: AppColors.mainColor, fontSize: 11.sp,
              fontFamily: AppFonts.fontMedium),
        ],
      ),
    );
  }
}
