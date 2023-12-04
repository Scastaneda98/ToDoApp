import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/usecases/tasks/change_task_status_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/create_task_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/delete_task_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/get_tasks_usecase.dart';
@Injectable()
class TaskUseCases {

  CreateTaskUseCase createTask;
  GetTasksUseCase getTasks;
  DeleteTaskUseCase deleteTask;
  ChangeTaskStatusUseCase completedTask;

  TaskUseCases({required this.createTask, required this.getTasks, required this.deleteTask, required this.completedTask});


}