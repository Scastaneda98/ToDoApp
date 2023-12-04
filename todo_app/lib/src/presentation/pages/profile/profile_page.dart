import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/domain/models/user/user_model.dart';
import 'package:todo_app/src/domain/utils/resource.dart';
import 'package:todo_app/src/presentation/pages/profile/profile_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/profile/widgets/profile_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    ProfileViewModel viewModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      body: StreamBuilder(
        stream: viewModel.getUserById(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(!snapshot.hasData) {
            return const Center(
              child: Text('Profile not found'),
            );
          }
          final response = snapshot.data;
          if(response is Failure) {
            final data = response as Failure;
            return Center(
              child: Text('Error: ${data.error}'),
            );
          }
          final success = response as Success<UserModel>;
          return ProfileContent(viewModel, success.data);
        }),
      )
    );
  }
}
