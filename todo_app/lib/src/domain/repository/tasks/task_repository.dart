import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

abstract class TaskRepository {

  Future<Resource<String>> create(TaskModel task);
  Stream<Resource<List<TaskModel>>> getTasks(String id);
}