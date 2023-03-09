import 'package:flutter/cupertino.dart';

class AddEmployeeViewModel{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController accessController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}