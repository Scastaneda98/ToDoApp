import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/models/tasks/task_status.dart';
import 'package:todo_app/src/domain/repository/tasks/task_repository.dart';

@Injectable()
class ChangeTaskStatusUseCase {
  TaskRepository _repository;

  ChangeTaskStatusUseCase(this._repository);

  launch(String id, TaskStatus status) => _repository.changeTaskStatus(id, status);
}