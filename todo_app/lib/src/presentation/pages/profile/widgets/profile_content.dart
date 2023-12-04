import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:todo_app/src/domain/models/user/user_model.dart';
import 'package:todo_app/src/presentation/pages/profile/profile_viewmodel.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';
import 'package:todo_app/src/presentation/widgets/default_button.dart';

class ProfileContent extends StatelessWidget {

  ProfileViewModel viewModel;
  UserModel userModel;

  ProfileContent(this.viewModel, this.userModel, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: WaveClipperOne(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            color: primaryColor,
            child: Container(
              margin: const EdgeInsets.only(top: 60, bottom: 40),
              child: Image.asset(
                'assets/images/user_image.png',
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Text(
            userModel.username,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            userModel.email,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
          child: DefaultButton(
            onPressed: () async{
               await viewModel.logout();
               Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
            buttonText: 'Logout',
            icon: Icons.power_settings_new,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
