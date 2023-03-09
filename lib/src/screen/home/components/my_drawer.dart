import 'package:admin/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/text/custom_text.dart';
import '../../../helper/cache_helper.dart';
import '../../../utility/all_app_words.dart';
import '../../../utility/app_theme.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding:  EdgeInsets.all(8.sp),
              child: const Icon(Icons.menu,size: 30,),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.all(12.sp),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 27.r,
                    backgroundImage: const AssetImage(AppImage.splash,package: 'admin',),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(maxLines: 1,text: 'kareem', color: AppColors.black,
                            fontSize: 18.sp, fontFamily: AppFonts.fontBold),
                        CustomText(maxLines: 1,text: 'EXCP', color: AppColors.mainColor,
                            fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                goToScreen(screenNames: ScreenNames.homeScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.home,package: 'admin',width: 25.w,height: 23.h,),
                    SizedBox(width: 10.w,),
                    CustomText(text: AppWords.home, color: AppColors.black,
                        fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                goToScreen(screenNames: ScreenNames.myProfileScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.person,package: 'admin',width: 25.w,height: 23.h,),
                    SizedBox(width: 10.w,),
                    CustomText(text: AppWords.profile, color: AppColors.black,
                        fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                goToScreen(screenNames: ScreenNames.addEmployeeScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(Icons.person_add_alt_1_rounded,color: AppColors.mainColor,size: 30,),
                    SizedBox(width: 10.w,),
                    CustomText(text: AppWords.add_employee, color: AppColors.black,
                        fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                CacheHelper.removeData(key: 'token').then((value) {
//                  goToScreen(screenNames: ScreenNames.loginScreen);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.out,package: 'admin',width: 25.w,height: 23.h,),
                    SizedBox(width: 10.w,),
                    CustomText(text: AppWords.log, color: AppColors.black,
                        fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
