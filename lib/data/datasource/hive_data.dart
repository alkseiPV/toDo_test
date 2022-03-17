import 'package:hive_flutter/adapters.dart';
import 'package:todo_test/data/models/model.dart';
import 'package:todo_test/domain/usecases/add_task.dart';
import 'package:todo_test/domain/usecases/change_complete.dart';
import 'package:todo_test/domain/usecases/change_task.dart';

abstract class HiveTask {
  Future<List<ModelTask>> taskInit();
}

class HiveTaskImpl implements HiveTask {
  int a = 0;
  @override
  Future<List<ModelTask>> taskInit() async {
    if (a == 0) {
      Hive.registerAdapter(ModelTaskAdapter());
    }

    var box = await Hive.openBox<ModelTask>("tasks");
    List<ModelTask> taskList = box.values.toList();
    a = 1;
    return taskList;
  }
}

class AddTaskImpl implements AddTaskHive {
  @override
  Future addTask(String task) async {
    var box = Hive.box<ModelTask>("tasks");
    box.add(ModelTask(complete: false, task: task));
    
  }
}

class ChangeTaskImpl implements ChangeTaskHive {
  @override
  Future changeTask(String task, ) async {
    var box = Hive.box<ModelTask>("tasks");
    List<ModelTask> res = box.values.toList();
    box.putAt(res.length-1, ModelTask(complete: false, task: task));
  }
}

class ChangeCompleteImpl extends ChangeComplete{
  @override
  Future changeCompleteElement(int indx)async{
   var box = Hive.box<ModelTask>("tasks");
   ModelTask? res = box.getAt(indx);
   var changed = box.getAt(indx)!.complete=!box.getAt(indx)!.complete;
   box.putAt(indx, ModelTask(complete: changed, task: res!.task));
  }

}