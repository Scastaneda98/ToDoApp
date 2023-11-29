import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/presentation/pages/auth/register/register_response.dart';
import 'package:todo_app/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/auth/register/widgets/register_content.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RegisterResponse(context, viewModel);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: RegisterContent(viewModel)
    );
  }
}
