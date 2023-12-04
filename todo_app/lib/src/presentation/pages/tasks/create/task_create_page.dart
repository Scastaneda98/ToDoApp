import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/presentation/pages/tasks/create/task_create_response.dart';
import 'package:todo_app/src/presentation/pages/tasks/create/task_create_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/tasks/create/widgets/task_create_content.dart';

class TaskCreatePage extends StatelessWidget {
  const TaskCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskCreateViewModel viewModel = Provider.of<TaskCreateViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TaskCreateResponse(context,viewModel);
    });
    return Scaffold(
      body: TaskCreateContent(viewModel),
    );
  }
}
