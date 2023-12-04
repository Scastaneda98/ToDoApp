import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/models/tasks/task_status.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

abstract class TaskRepository {

  Future<Resource<String>> create(TaskModel task);
  Future<Resource<String>> delete(String id);
  Future<Resource<String>> changeTaskStatus(String id, TaskStatus status);
  Stream<Resource<List<TaskModel>>> getTasks(String id);
}