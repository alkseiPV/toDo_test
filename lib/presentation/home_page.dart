// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_test/domain/bloc/task_bloc.dart';
import 'package:todo_test/domain/bloc/task_event.dart';


import 'package:todo_test/presentation/task_list.dart';

class HomePage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String? task;
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskBloc userBlocTask = context.read<TaskBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Tasks",
          style: TextStyle(
              fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 243, 255, 1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: IconButton(
                onPressed: () {
                  userBlocTask.add(LoadTaskEvent());
                  Future.delayed(const Duration(milliseconds: 500), () {
                    userBlocTask.add(AddTaskEvent());
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: TextFormField(
                              key: formKey,
                              decoration: const InputDecoration(
                                  labelText: "enter the data"),
                              onChanged: (value) {
                                task = value;
                                userBlocTask.add(ChangeTaskEvent(
                                  task: task!,
                                ));
                                userBlocTask.add(LoadTaskEvent());
                              },
                            ),
                          );
                        });
                  });
                },
                icon: const Icon(
                  Icons.add,
                  size: 25,
                  color: Color.fromRGBO(87, 87, 103, 1),
                )),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
      body: const TaskList(),
    );
  }
}
