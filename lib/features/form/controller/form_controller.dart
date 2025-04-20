import 'package:cartoontv/features/form/data/form_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FormController {
  final BuildContext context;
  final VoidCallback reloadData;

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? selectedGender;

  FormController ({required this.context, required this.reloadData});

  void validateForm() {
    if (formKey.currentState!.validate() && selectedGender != null) {
      submitForm();
    } else if (selectedGender == null) {
      EasyLoading.showInfo('Please select a gender');
    }
  }

  void submitForm() async {
   EasyLoading.show(status: 'Submitting...');
   final response = await FormDatasource().submitForm(nameController.text, emailController.text, selectedGender ?? '');
   EasyLoading.dismiss();
   if (response != null){
     EasyLoading.showSuccess(response.id.toString());
     Future.delayed(const Duration(seconds: 2),()=> Navigator.pop(context));
   }
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
  }
}