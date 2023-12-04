import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/core/constants.dart';
import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/repository/tasks/task_repository.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {

  final CollectionReference _taskReferences;

  TaskRepositoryImpl(@Named(TASKS) this._taskReferences);

  @override
  Future<Resource<String>> create(TaskModel task) async{
    try {
      final data = await _taskReferences.add(task.toJson());
      return Success('Task created successfully');
    } on FirebaseException catch(exception) {
      return Failure(exception.message ?? 'Missing error');
    }
  }

  @override
  Stream<Resource<List<TaskModel>>> getTasks(String id) {
    try {
      final data = _taskReferences.where('id_user', isEqualTo: id).snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs.map((task) => TaskModel.fromJson(task.data() as Map<String, dynamic>)).toList()));
      return dataMap;
    } on FirebaseException catch(exception) {
      throw Failure(exception.message ?? 'Missing Error');
    }
  }
  
}