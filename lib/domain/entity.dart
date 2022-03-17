import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String task;
  bool complete;
   TaskEntity({
    required this.complete,
    required this.task,
  });
  @override
  List<Object?> get props => [complete, task];
}
