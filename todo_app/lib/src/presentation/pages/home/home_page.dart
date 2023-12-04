import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/presentation/pages/home/home_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/home/widgets/home_bottom_bar.dart';
import 'package:todo_app/src/presentation/pages/profile/profile_page.dart';
import 'package:todo_app/src/presentation/pages/tasks/list/tasks_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    final currentTab = [
      const TasksListPage(),
      const ProfilePage()
    ];

    return Scaffold(
      body: currentTab[viewModel.currentIndex],
      bottomNavigationBar: HomeBottomBar(context, viewModel),
    );
  }
}
