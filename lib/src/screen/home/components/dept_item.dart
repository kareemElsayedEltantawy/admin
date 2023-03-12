import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/text/custom_text.dart';
import '../../../models/company_model.dart';
import '../../../utility/all_app_words.dart';
import '../../../utility/app_theme.dart';

class DeptItem extends StatelessWidget {
  final Department model;

  const DeptItem({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 85.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: const DecorationImage(image: AssetImage(AppImage.splash,package: 'admin',),fit: BoxFit.cover),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.sp),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.6),
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(12.r),
                bottomEnd: Radius.circular(12.r),
              )
          ),
          child: CustomText(text: model.name.toString(),
              textAlign: TextAlign.center,
              maxLines: 1,
              color: AppColors.white, fontSize: 14.sp,
              fontFamily: AppFonts.fontMedium),
        )
      ],
    );
  }
}
