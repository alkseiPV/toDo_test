import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_test/domain/bloc/task_bloc.dart';
import 'package:todo_test/locator_service.dart' as di;
import 'package:todo_test/locator_service.dart';
import 'package:todo_test/presentation/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (context) => sl<TaskBloc>(),
      child:  MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
