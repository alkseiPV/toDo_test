
import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTaskEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {}

class ChangeTaskEvent extends TaskEvent {
  final String task;


  ChangeTaskEvent({required this.task,});
}

class CompleteTaskEvent extends TaskEvent{
  final int indx;

  CompleteTaskEvent({required this.indx});

}
