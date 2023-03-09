import 'dart:convert';

import 'package:admin/src/models/get_add_company_info_model.dart';
import 'package:admin/src/services/app_services.dart';

class AdminController {
  static Future<GetAddCompanyInfoModel?> addCompany(
      {required String adminId,
      required String companyName,
      required String companyLogo}) async {
    var result = await AppService.callService(
      apiName: 'Company/AddCompany?AdminId=$adminId',
      actionType: ActionType.post,
      body: {
        'Name': companyName,
        'Logo': companyLogo,
      },
    );

    return result != null
        ? GetAddCompanyInfoModel.fromJson(jsonDecode(result))
        : null;
  }
}
