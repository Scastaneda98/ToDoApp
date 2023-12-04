import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/pages/home/home_viewmodel.dart';

class HomeBottomBar extends StatelessWidget {

  HomeViewModel viewModel;
  BuildContext context;

  HomeBottomBar(this.context, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
        viewModel.currentIndex = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          )
        ]
    );
  }
}
