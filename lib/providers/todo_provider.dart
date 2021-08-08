import 'package:flutter/cupertino.dart';
import 'package:todo_provider/Models/todo.dart';
import 'package:todo_provider/helpers/db_helper.dart';

class TodoProvider extends ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String msg = "msg from provider";
  List<Todo> allTasks;
  TodoProvider() {
    //or we can call it inside init()
    getAllTask();
  }

  getAllTask() async {
    this.allTasks = await databaseHelper.getTodoList();
    notifyListeners();
  }

  changeTestMsg(String newMsg) {
    this.msg = newMsg;
    //as setSatate :
    //any provider uses and the listen:true will recivieved notification from provider
    //will send notificatin for all providers
    notifyListeners();
  }

  insertTask(Todo todo) async {
    await databaseHelper.insertTodo(todo);
    getAllTask();
  }

  deleteTask(Todo todo) async {
    await databaseHelper.deleteTodo(todo.id);
    getAllTask();
  }

  updateTask(Todo todo) async {
    await databaseHelper.updateTodo(todo);
    getAllTask();
  }

  updateStatus(Todo todo) async {
    await databaseHelper.updateStatus(todo);
    getAllTask();
  }
}
