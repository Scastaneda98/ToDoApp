import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/src/domain/utils/resource.dart';
import 'package:todo_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:todo_app/src/presentation/utils/show_dialog.dart';

class LoginResponse {
  LoginViewModel viewModel;
  BuildContext context;

  LoginResponse(this.context, this.viewModel) {
    if(viewModel.response is Success) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else if (viewModel.response is Loading) {
      buildShowDialog(context);
    } else if (viewModel.response is Failure) {
      final data = viewModel.response as Failure;
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: 'Error: ${data.error}',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 3
      );
      viewModel.resetResponse();
    }
  }
}