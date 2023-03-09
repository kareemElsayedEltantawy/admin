import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/text/custom_text.dart';
import '../../routes/routes.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';
import '../home/components/employee_item.dart';

class AllEployeesScreen extends StatelessWidget {
  const AllEployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: AppWords.employees, color: AppColors.black,
            fontSize: 16.sp, fontFamily: AppFonts.fontBold),
        leading: IconButton(onPressed: (){
          goBack();
        },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Padding(
        padding:  EdgeInsets.all(12.sp),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 6.0,
          childAspectRatio: 1.2/1,
          children: List.generate(20, (index) => EmployeeItem()),
        ),
      ),

    );
  }
}
