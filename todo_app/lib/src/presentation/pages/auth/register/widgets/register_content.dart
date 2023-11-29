import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';
import 'package:todo_app/src/presentation/widgets/default_button.dart';
import 'package:todo_app/src/presentation/widgets/default_textfield.dart';

class RegisterContent extends StatelessWidget {

  RegisterViewModel viewModel;

  RegisterContent(this.viewModel, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: primaryColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 50, left: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/document.png',
                      height: 100,
                      width: 150,
                    ),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextField(
            onChange: (value) {
                viewModel.changeUsername(value);
              },
            label: 'Username',
            icon: Icons.person_outline,
            error: viewModel.state.username.error,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextField(
            onChange: (value) {
                viewModel.changeEmail(value);
              },
            label: 'Email',
            icon: Icons.email_outlined,
            error: viewModel.state.email.error,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextField(
            onChange: (value) {
                viewModel.changePassword(value);
              },
            label: 'Password',
            icon: Icons.lock_outline,
            error: viewModel.state.password.error,
            secureText: true,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextField(
            onChange: (value) {
                viewModel.changeConfirmPassword(value);
              },
            label: 'Confirm Password',
            icon: Icons.lock_outline,
            error: viewModel.state.confirmPassword.error,
            secureText: true,
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: DefaultButton(
            onPressed: () {
              viewModel.register();
            },
            buttonText: 'Register'
          ),
        )
      ],
    );
  }
}
