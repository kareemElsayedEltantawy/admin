import 'dart:convert';
import 'package:admin/src/models/get_add_company_info_model.dart';
import 'package:admin/src/services/app_services.dart';

import '../../models/company_model.dart';

class AdminController {

  static Future<GetAddCompanyInfoModel?> addCompany({
      required String adminId,
      required String companyName,
      required String companyLogo}) async {
    var result = await AppService.callService(
      actionType: ActionType.post,
      apiName: 'Company/AddCompany?AdminId=$adminId',
      body: {
        'Name': companyName,
        'Logo': companyLogo,
      },
    );
    return result != null ? GetAddCompanyInfoModel.fromJson(jsonDecode(result)) : null;
  }

  static Future<CompanyModel?> getHome(String id)async{
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: 'Company/GetCompanyById?id=$id',
        body: null);
    return result != null ? CompanyModel.fromJson(jsonDecode(result)) : null;
  }

}
