// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/domain/bloc/task_event.dart';
import 'package:todo_test/domain/bloc/task_state.dart';
import 'package:todo_test/domain/repository.dart';
import 'package:todo_test/domain/usecases/add_task.dart';
import 'package:todo_test/domain/usecases/change_complete.dart';
import 'package:todo_test/domain/usecases/change_task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  final AddTaskHive addTaskHive;
  final ChangeTaskHive changeTaskHive;
  final ChangeComplete changeComplete;
  TaskBloc(
      {required this.taskRepository,
      required this.addTaskHive,
      required this.changeTaskHive,
      required this.changeComplete})
      : super(EmptyTaskState()) {
    on<LoadTaskEvent>((event, emit) async {
      emit(LoadingTaskState());
      try {
        final box = await taskRepository.taskRep();
        emit(LoadedTaskState(loadedtask: box));
      } catch (e) {
        print(e.toString());
      }
    });
    on<AddTaskEvent>((event, emit) {
      addTaskHive.addTask("defolt");
    });
    on<ChangeTaskEvent>((event, emit) {
      changeTaskHive.changeTask(
        event.task,
      );
    });
    on<CompleteTaskEvent>((event, emit) {
      changeComplete.changeCompleteElement(event.indx);
    });
  }
}
