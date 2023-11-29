import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:todo_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';
import 'package:todo_app/src/presentation/widgets/default_button.dart';
import 'package:todo_app/src/presentation/widgets/default_textfield.dart';

class LoginContent extends StatelessWidget {
  LoginViewModel viewModel;

  LoginContent(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/checklist.png',
                  height: 100,
                  width: 150,
                ),
                const Text(
                  'ToDo List',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 25),
          child: const Text(
            'Login',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const Spacer(),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextField(
              onChange: (value) {
                viewModel.changeEmail(value);
              },
              error: viewModel.state.email.error,
              label: 'Email',
              icon: Icons.email_outlined,
            )
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextField(
              onChange: (value) {
                viewModel.changePassword(value);
              },
              error: viewModel.state.password.error,
              label: 'Password',
              icon: Icons.lock_outline,
              secureText: true,
            )
        ),
        Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: DefaultButton(onPressed: () {
              viewModel.login();
            }, buttonText: 'Login')
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 70),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text('Register'),
          ),
        )
      ],
    );
  }
}
