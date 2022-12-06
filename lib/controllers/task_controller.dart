import 'package:get/get.dart';
import 'package:todoapp/db/db_helper.dart';
import 'package:todoapp/models/task.dart';

class TaskController extends GetxController {

  final RxList<Task> taskList = <Task>[].obs;

  Future addTask({Task? task}){
    return DBHelper.insert(task);
  }

  Future<void> getTasks() async{
    final tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  deleteTasks(Task task) async{
    await DBHelper.delete(task);
    getTasks();
  }
  deleteAllTasks() async{
    await DBHelper.deleteAll();
    getTasks();
  }

  markUsCompleted(int id) async{
    await DBHelper.update(id);
    getTasks();
  }


}
