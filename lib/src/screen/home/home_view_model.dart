import 'package:admin/src/controllers/admin/admin_controller.dart';
import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:admin/src/models/company_model.dart';

class HomeViewModel {
  GenericCubit<CompanyModel?> getCompanyDataCubit = GenericCubit();
  Loading loading = Loading();

  Future<void> initData(String id) async {
    loading.show;
    CompanyModel? companyModel = await AdminController.getCompanyData(id);
    if (companyModel != null) {
      getCompanyDataCubit.update(data: companyModel);
    }
    loading.hide;
  }
}
