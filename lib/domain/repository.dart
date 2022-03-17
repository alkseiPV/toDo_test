import 'package:todo_test/domain/entity.dart';

abstract class TaskRepository{
  Future<List<TaskEntity>> taskRep();
}