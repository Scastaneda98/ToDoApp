import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/utils/resource.dart';
import 'package:todo_app/src/presentation/pages/tasks/list/tasks_list_viewmodel.dart';
import 'package:todo_app/src/presentation/pages/tasks/list/widgets/tasks_list_item.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';

class TasksListPage extends StatelessWidget {
  const TasksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    TasksListViewModel viewModel = Provider.of<TasksListViewModel>(context);
    return Scaffold(
      body:
      StreamBuilder(
        stream: viewModel.getTasks(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(!snapshot.hasData) {
            return const Center(
              child: Text('No tasks found'),
            );
          }
          final response = snapshot.data;
          if(response is Failure) {
            final data = response as Failure;
            return Center(
              child: Text('Error ${data.error}'),
            );
          }
          final tasks = response as Success<List<TaskModel>>;
          return ListView.builder(
            itemBuilder: (context, index) => TaskListItem(tasks.data[index]),
            itemCount: tasks.data.length,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.pushNamed(context, '/task/create');
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),

    );
  }
}
