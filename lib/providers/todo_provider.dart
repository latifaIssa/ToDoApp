import 'package:flutter/cupertino.dart';
import 'package:todo_provider/helpers/db_helper.dart';

class TodoProvider extends ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String msg = "msg from provider";
  List<Todo> allTasks;
  getAllTask() async {
    this.allTasks = await databaseHelper.getTodoList();
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
}
