import 'package:admin/src/screen/add_company/add_company_screen.dart';
import 'package:admin/src/screen/add_department/add_department_screen.dart';
import 'package:admin/src/screen/all_employees/all_employees_screen.dart';
import 'package:admin/src/screen/home/home_screen.dart';
import 'package:admin/src/screen/my_profile/my_profile_screen.dart';
import 'package:admin/src/screen/profile/employee_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/add_employee/add_employee_screen.dart';
part 'app_navigator.dart';

appRoutes(context) {

  var routes = {
  ScreenNames.addCompanyScreen:(context) => AddCompanyScreen(),
    ScreenNames.homeScreen: (context) => HomeScreen(),
    ScreenNames.allEployeesScreen:(context) => AllEployeesScreen(),
    ScreenNames.addDepartmentScreen:(context) => AddDepartmentScreen(),
    ScreenNames.employeeProfileScreen:(context) => EmployeeProfileScreen(),
    ScreenNames.myProfileScreen:(context) => MyProfileScreen(),
    ScreenNames.addEmployeeScreen:(context) => AddEmployeeScreen(),
//    ScreenNames.loginScreen:(context) => LoginScreen(),
  };

  return routes;
}

class ScreenNames {
  static const String addCompanyScreen = '/';
  static String homeScreen = 'HomeScreen';
  static String allEployeesScreen = 'AllEployeesScreen';
  static String addDepartmentScreen = 'AddDepartmentScreen';
  static String employeeProfileScreen = 'EmployeeProfileScreen';
  static String myProfileScreen = 'MyProfileScreen';
  static String addEmployeeScreen = 'AddEmployeeScreen';
//  static String loginScreen = 'LoginScreen';
}
