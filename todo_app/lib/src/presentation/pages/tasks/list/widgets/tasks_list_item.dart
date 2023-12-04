import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';

class TaskListItem extends StatelessWidget {
  TaskModel task;

  TaskListItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              task.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              task.description,
              style: const TextStyle(
                  fontSize: 18,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                margin: const EdgeInsets.only(left: 60, right: 20, top: 10, bottom: 10),
                child: Text(
                  task.date,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}
