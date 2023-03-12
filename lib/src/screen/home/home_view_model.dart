import 'package:admin/src/controllers/admin/admin_controller.dart';
import 'package:admin/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:admin/src/models/company_model.dart';

class HomeViewModel{

  GenericCubit<bool> getHomeCubit = GenericCubit(data: false);

  CompanyModel? companyModel;

  Future<void> getHome(String id)async{
    getHomeCubit.update(data: true);
    companyModel = await AdminController.getHome(id);
    getHomeCubit.update(data: false);
  }

}