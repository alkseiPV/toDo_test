import 'package:equatable/equatable.dart';
import 'package:todo_test/domain/entity.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptyTaskState extends TaskState {}

class LoadingTaskState extends TaskState {}

class LoadedTaskState extends TaskState {
  final List<TaskEntity> loadedtask;
  LoadedTaskState({required this.loadedtask});
  @override
  List<Object?> get props => [loadedtask];
}

class ErrorTaskState extends TaskState{
  
}
