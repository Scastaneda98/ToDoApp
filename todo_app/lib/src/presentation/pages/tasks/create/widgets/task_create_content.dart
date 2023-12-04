import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:todo_app/src/presentation/pages/tasks/create/task_create_viewmodel.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';
import 'package:todo_app/src/presentation/widgets/default_button.dart';
import 'package:todo_app/src/presentation/widgets/default_textfield.dart';

class TaskCreateContent extends StatelessWidget {

  TaskCreateViewModel viewModel;
  TaskCreateContent(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/description.png',
                        height: 100,
                        width: 150,
                      ),
                      const Text(
                        'Create Task',
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
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DefaultTextField(
              controller: viewModel.titleController,
              label: 'Title',
              icon: Icons.task_outlined,
              error: viewModel.state.title.error,
              onChange: (value) {
                viewModel.changeTitle(value);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: DefaultTextField(
              controller: viewModel.descriptionController,
              label: 'Description',
              icon: Icons.description_outlined,
              maxLines: 5,
              error: viewModel.state.description.error,
              onChange: (value) {
                viewModel.changeDescription(value);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: DefaultButton(
              onPressed: () {
                viewModel.createTask();
              },
              buttonText: 'Save',
              icon: Icons.save_outlined,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
