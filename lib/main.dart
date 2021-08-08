import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/providers/todo_provider.dart';
import 'package:todo_provider/screens/todo_list.dart';

void main() => runApp(
        // Provider<TodoProvider>(
        //   create: (context) => TodoProvider(),
        //   child: MyApp(),
        // ),
        ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ));

class ToDoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: TodoList(title: 'To Do List'),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Provider.of<TodoProvider>(context, listen: false).msg,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                //just for display ==> listen:true(default)
                // child: Text(Provider.of<TodoProvider>(context).msg),
                child: Text('change msg'),
                onPressed: () {
                  //action ==> listen:false
                  // print(Provider.of<TodoProvider>(context, listen: false).msg);
                  Provider.of<TodoProvider>(context, listen: false)
                      .changeTestMsg('hello');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
