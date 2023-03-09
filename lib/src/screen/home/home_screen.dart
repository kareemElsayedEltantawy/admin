import 'package:admin/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/text/custom_text.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';
import '../all_employees/components/employee_item.dart';
import 'components/dept_item.dart';
import 'components/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: AppWords.home, color: AppColors.black,
            fontSize: 16.sp, fontFamily: AppFonts.fontBold),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(12.sp),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: [
                    CustomText(text: AppWords.departments, color: AppColors.black,
                        fontSize: 18.sp, fontFamily: AppFonts.fontBold),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        goToScreen(screenNames: ScreenNames.addDepartmentScreen);
                      },
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: AppColors.mainColor,
                        child: Icon(Icons.add,color: AppColors.white,size: 20.0,),
                      ),
                    )
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 1.8/1,
                children: List.generate(8, (index) => DeptItem()),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  children: [
                    CustomText(text: AppWords.employees, color: AppColors.black,
                        fontSize: 18.sp, fontFamily: AppFonts.fontBold),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        goToScreen(screenNames: ScreenNames.allEployeesScreen);
                      },
                      child: CustomText(text: AppWords.all, color: AppColors.Kbluecolor,
                          fontSize: 18.sp, fontFamily: AppFonts.fontBold),
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 1.2/1,
                children: List.generate(6, (index) => EmployeeItem()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
