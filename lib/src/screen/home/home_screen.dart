import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/routes/routes.dart';
import 'package:admin/src/screen/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/text/custom_text.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';
import 'components/dept_item.dart';
import 'components/employee_item.dart';
import 'components/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel homeViewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppWords.home,
            color: AppColors.black,
            fontSize: 16.sp,
            fontFamily: AppFonts.fontBold),
      ),
      drawer: MyDrawer(),
      body: BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
        bloc: homeViewModel.getHomeCubit,
        listener: (context, state) {},
        builder: (context, state) {
          return state.data! ? const CircularProgressIndicator() :  SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      children: [
                        CustomText(
                            text: AppWords.departments,
                            color: AppColors.black,
                            fontSize: 18.sp,
                            fontFamily: AppFonts.fontBold),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            goToScreen(
                                screenNames: ScreenNames.addDepartmentScreen);
                          },
                          child: CircleAvatar(
                            radius: 22.r,
                            backgroundColor: AppColors.mainColor,
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 20.0,
                            ),
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
                    childAspectRatio: 1.8 / 1,
                    children: List.generate(homeViewModel.companyModel!.data![0].departments!.length,
                            (index) => DeptItem(model : homeViewModel.companyModel!.data![0].departments![index])),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      children: [
                        CustomText(
                            text: AppWords.employees,
                            color: AppColors.black,
                            fontSize: 18.sp,
                            fontFamily: AppFonts.fontBold),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            goToScreen(
                                screenNames: ScreenNames.allEployeesScreen);
                          },
                          child: CustomText(
                              text: AppWords.all,
                              color: AppColors.Kbluecolor,
                              fontSize: 18.sp,
                              fontFamily: AppFonts.fontBold),
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
                    childAspectRatio: 1.2 / 1,
                    children: List.generate(homeViewModel.companyModel!.data![0].applicationUsers!.length,
                            (index) => EmployeeItem(model:homeViewModel.companyModel!.data![0].applicationUsers![index])),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
