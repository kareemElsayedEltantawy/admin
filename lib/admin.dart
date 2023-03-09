import 'package:admin/src/routes/routes.dart';
import 'package:admin/src/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();


class StartCycleAdmain extends StatelessWidget {
  const StartCycleAdmain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 761),//for ScreenUtilInit ,(375, 761) from xd
        minTextAdapt: true,//for ScreenUtilInit ,true daeman
        splitScreenMode: true,//for ScreenUtilInit ,true daeman
        builder: (context , child) { //for ScreenUtilInit
          return GetMaterialApp(
            key:  const Key("admin_cycle_key"),
            scaffoldMessengerKey: scaffoldKey ,
            navigatorKey: navigatorKey,
            locale: const Locale("ar"),
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            routes: appRoutes(context), //appRoutes() is method in routes.dart file (dont forget to import get: ^4.6.5 and convert MaterialApp to GetMaterialApp)
            initialRoute:  ScreenNames.addCompanyScreen, //first screen in the app
          );
        }
    );
  }
}