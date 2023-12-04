import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/repository/tasks/task_repository.dart';

@Injectable()
class CompletedTaskUseCase {
  TaskRepository _repository;

  CompletedTaskUseCase(this._repository);

  launch(String id) => _repository.completedTask(id);
}