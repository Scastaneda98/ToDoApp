import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/repository/tasks/task_repository.dart';

@Injectable()
class DeleteTaskUseCase {
  TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  launch(String id) => _repository.delete(id);
}