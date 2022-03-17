import 'package:get_it/get_it.dart';
import 'package:todo_test/data/datasource/hive_data.dart';
import 'package:todo_test/data/repository/repository_data.dart';
import 'package:todo_test/domain/bloc/task_bloc.dart';
import 'package:todo_test/domain/repository.dart';
import 'package:todo_test/domain/usecases/add_task.dart';
import 'package:todo_test/domain/usecases/change_complete.dart';
import 'package:todo_test/domain/usecases/change_task.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => TaskBloc(
        taskRepository: sl(),
        addTaskHive: sl(),
        changeTaskHive: sl(),
        changeComplete: sl(),
      ));
  sl.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(hiveTask: sl()));

  sl.registerLazySingleton<AddTaskHive>(() => AddTaskImpl());
  sl.registerLazySingleton<ChangeComplete>(() => ChangeCompleteImpl());
  sl.registerLazySingleton<ChangeTaskHive>(() => ChangeTaskImpl());
  sl.registerLazySingleton<HiveTask>(() => HiveTaskImpl());
}
