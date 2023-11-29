import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/presentation/pages/auth/login/login_response.dart';
import 'package:todo_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/auth/login/widgets/login_content.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      LoginResponse(context,viewModel);
    });
    return Scaffold(
      body: LoginContent(viewModel)
    );
  }
}

