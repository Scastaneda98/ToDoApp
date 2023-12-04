import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/usecases/tasks/completed_task_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/create_task_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/delete_task_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/get_tasks_usecase.dart';
@Injectable()
class TaskUseCases {

  CreateTaskUseCase createTask;
  GetTasksUseCase getTasks;
  DeleteTaskUseCase deleteTask;
  CompletedTaskUseCase completedTask;

  TaskUseCases({required this.createTask, required this.getTasks, required this.deleteTask, required this.completedTask});


}