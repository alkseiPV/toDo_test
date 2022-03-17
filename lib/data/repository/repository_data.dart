import 'package:todo_test/data/datasource/hive_data.dart';
import 'package:todo_test/domain/entity.dart';
import 'package:todo_test/domain/repository.dart';

class TaskRepositoryImpl implements TaskRepository{
  final HiveTask hiveTask;
  TaskRepositoryImpl({required this.hiveTask});
  @override
  Future<List<TaskEntity>> taskRep()async {
 final dataTask = await hiveTask.taskInit();
 return dataTask;
  }

}