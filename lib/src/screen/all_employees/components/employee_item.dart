import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/text/custom_text.dart';
import '../../../routes/routes.dart';
import '../../../utility/all_app_words.dart';
import '../../../utility/app_theme.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key});

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
              image: const DecorationImage(image: AssetImage(AppImage.splash,package: 'admin',),fit: BoxFit.cover),
            ),
          ),
          CustomText(text: 'mobile dev',
              color: AppColors.black, fontSize: 12.sp,
              fontFamily: AppFonts.fontMedium),
          CustomText(text: 'mobile dev',
              color: AppColors.mainColor, fontSize: 11.sp,
              fontFamily: AppFonts.fontMedium),
        ],
      ),
    );
  }
}
