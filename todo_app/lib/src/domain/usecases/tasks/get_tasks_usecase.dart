import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/repository/tasks/task_repository.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

@Injectable()
class GetTasksUseCase {
  TaskRepository _repository;

  GetTasksUseCase(this._repository);
  
  Stream<Resource<List<TaskModel>>> lauch(String id) => _repository.getTasks(id);
}