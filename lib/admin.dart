import 'package:admin/src/routes/routes.dart';
import 'package:admin/src/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();


class StartCycleAdmain extends StatefulWidget {
  final String token;
  final String userId;
  final String userName;
  final String fontLight;
  final String fontBold;
  final String fontMedium;
  final String companyId;
  const StartCycleAdmain({Key? key,
    required this.token,
    required this.userId,
    required this.fontLight,
  required this.userName , required this.fontMedium , required this.fontBold ,
  required this.companyId }) : super(key: key);

  @override
  State<StartCycleAdmain> createState() => _StartCycleAdmainState();
}

class _StartCycleAdmainState extends State<StartCycleAdmain> {

  @override
  void initState() {

    super.initState();
  }
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


/*
if (state.loginModel.data.user.emailConfirmed) {
              savePrefUserInfo(
                usercompanyid: state.loginModel.data.user.Company_id,
                user_id: state.loginModel.data.user.id,
                token: state.loginModel.data.token.accessToken,
                userName: state.loginModel.data.user.userName,
              );

              if (state.loginModel.data.roles.length > 1) {
                ShowBottonSheet(context, state.loginModel.data.roles,
                    state.loginModel.data.user.Company_id);
              } else if (state.loginModel.data.roles[0] == "Admin") {
                savePrefLogin(true, state.loginModel.data.roles[0]);

                if (state.loginModel.data.user.Company_id ==
                    "00000000-0000-0000-0000-000000000000") {
                  Navigator.of(context).pushNamed(add_company.RoutName);
                } else {
                  savePrefCompany(state.loginModel.data.user.Company_id);
                  BlocProvider.of<CompanyCubit>(context, listen: false)
                      .GetAllCompany_Data();
                  Navigator.of(context)
                      .pushReplacementNamed(AdminHome.RoutName);
                }
                // savePrefCompany(state.loginModel.data.user.Company_id);

              } else if (state.loginModel.data.roles[0] == "Employee") {
                savePrefLogin(true, state.loginModel.data.roles[0]);
                Navigator.of(context).pushReplacementNamed(SplashSce.RoutName);
              } else if (state.loginModel.data.roles[0] == "Manager") {
                savePrefLogin(true, state.loginModel.data.roles[0]);
                //   BlocProvider.of<ManagerCubit>(context,listen: false).GetUSerInfo();
                Navigator.of(context).pushReplacementNamed(Manager.routName);
              } else if (state.loginModel.data.roles[0] == "OfficeBoy") {
                savePrefLogin(true, state.loginModel.data.roles[0]);
                //   BlocProvider.of<ManagerCubit>(context,listen: false).GetUSerInfo();
                Navigator.of(context)
                    .pushReplacementNamed(HomePageOfficeBoy.routName);
              }
            } else {
              savePref(
                  BlocProvider.of<LoginBloc>(context, listen: false)
                      .usenameController
                      .text,
                  BlocProvider.of<LoginBloc>(context, listen: false)
                      .passwordcontroller
                      .text,
                  state.loginModel.data.user.id,
                  "login");
              Navigator.of(context).pushNamed(AccountVerify.RoutName);
            }
 */