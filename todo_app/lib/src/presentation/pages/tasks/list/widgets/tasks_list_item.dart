import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/models/tasks/task_status.dart';
import 'package:todo_app/src/presentation/pages/tasks/list/tasks_list_viewmodel.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';

class TaskListItem extends StatelessWidget {
  TaskModel task;
  TasksListViewModel viewModel;
  int indexTask;

  TaskListItem(this.task, this.viewModel, this.indexTask, {super.key});

  @override
  Widget build(BuildContext context) {
    print(task.id);
    return Card(
      color: secondaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Text(
                  viewModel.getTranslationTask(indexTask) ?
                  task.taskTranslated?.title ?? task.title : task.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      viewModel.changeTaskStatus(task.id, indexTask);
                    },
                    child: Icon(task.status == TaskStatus.completed.status ? Icons.check_circle : Icons.check_circle_outline),
                  )
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              viewModel.getTranslationTask(indexTask) ?
              task.taskTranslated?.description ?? task.description : task.description,
              style: const TextStyle(
                  fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  task.status,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                )
              ),
              Container(
                width: 120,
                height: 20,
                decoration: BoxDecoration(
                    color: neutralColor,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  task.date,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: () {
                    viewModel.translate(indexTask);
                  },
                  child: const Icon(Icons.translate),
                )
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () {
                      viewModel.deleteTask(task.id);
                    },
                    child: const Icon(Icons.delete),
                  )
              )
            ],
          ),
        ],
      ),
    );
  }
}
