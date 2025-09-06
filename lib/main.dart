import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/repositories/isar_todo_repo.dart';
import 'package:todo_app/features/todo/data/models/isar_todo.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_page.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_view.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // get directory for database

  final dir = await getApplicationDocumentsDirectory();

  // open isar database
  final isar = await Isar.open([IsarTodoSchema], directory: dir.path);

  // initialize our repository with isar database
  final isarTodoRepo = IsarTodoRepo(isar);

  runApp(TodoApp(todoRepo: isarTodoRepo));
}

class TodoApp extends StatelessWidget {

  //database injection through the app 
  final TodoRepo todoRepo;



  const TodoApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),  // pass the repository to the view
    );
  }
}