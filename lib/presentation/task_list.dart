import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/domain/bloc/task_bloc.dart';
import 'package:todo_test/domain/bloc/task_event.dart';
import 'package:todo_test/domain/bloc/task_state.dart';
import 'package:todo_test/domain/entity.dart';

import 'package:todo_test/presentation/widgets/my_shimmer.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskEntity> tasks = [];
    List<TaskEntity> reverseTask = [];
    final TaskBloc userBlocTask = context.read<TaskBloc>();
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is EmptyTaskState) {
          return GestureDetector(
            onTap: () {
              userBlocTask.add(LoadTaskEvent());
            },
            child: const Center(
              child: Text("List is Empty or not loaded (click) "),
            ),
          );
        }
        if (state is LoadingTaskState) {
          return ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ShimmerWidget.circular(
                    width: 30,
                    height: 30,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                  title: const ShimmerWidget.rectangular(
                    height: 16,
                    width: 45,
                  ),
                  subtitle: const ShimmerWidget.rectangular(
                    height: 12,
                    width: 70,
                  ),
                );
              });
        }
        if (state is LoadedTaskState) {
          if (state.loadedtask.isEmpty) {
            return const Center(child: Text('list is empty'));
          } else {
            tasks = state.loadedtask;
            reverseTask = tasks.reversed.toList();
          }
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(reverseTask[index].task),
                leading: IconButton(
                  onPressed: () {
                    userBlocTask.add(CompleteTaskEvent(indx:tasks.indexOf(reverseTask[index])));
                    userBlocTask.add(LoadTaskEvent());
                  },
                  icon: reverseTask[index].complete
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank),
                ));
          },
          itemCount: tasks.length,
        );
      },
    );
  }
}
