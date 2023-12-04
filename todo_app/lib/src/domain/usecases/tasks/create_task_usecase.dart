import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/repository/tasks/task_repository.dart';
@Injectable()
class CreateTaskUseCase{

  final TaskRepository _repository;

  CreateTaskUseCase(this._repository);

  launch(TaskModel task) => _repository.create(task);
}