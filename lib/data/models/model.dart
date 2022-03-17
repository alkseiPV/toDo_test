import 'package:hive_flutter/adapters.dart';
import 'package:todo_test/domain/entity.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
// ignore: must_be_immutable
class ModelTask extends TaskEntity {
  @HiveField(0)
  final String task;

  @HiveField(1)
  bool complete;
  ModelTask({
    required this.complete,
    required this.task,
  }) : super(complete: complete, task: task);
}
