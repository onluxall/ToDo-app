/*
  Todo Cubit
  Is responsible for managing the state of the todo list.
  It interacts with the TodoRepo to perform CRUD operations and updates the UI accordingly.
*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';

class TodoCubit extends Cubit<List<TodoEntity>> {
  //Reference to the TodoRepo
  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
    // Initial fetch of todos when the cubit is created
    loadTodos();
  }

  // Methods for adding, deleting, updating, and fetching todos will be here

  // L O A D T O D O S
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();   // Fetch todos from the  domain repository
    emit(todoList);
  }

  // A D D T O D O

  Future<void> addTodo(String text) async {
     // create todo using the domain repository with unique id
     final newTodo = TodoEntity(
      id: DateTime.now().millisecondsSinceEpoch, // Unique ID based on timestamp
      text: text,
     );

    // save todo to the repository
    await todoRepo.addTodo(newTodo);
    
    // Refresh the list after adding
    loadTodos();  
  }

  // D E L E T E T O D O

  Future<void> deleteTodo(TodoEntity todo) async {
    await todoRepo.deleteTodo(todo);
    // Refresh the list after deleting
    loadTodos();
  }

  // T O G G L E C O M P L E T I O N

  Future<void> toggleCompletion(TodoEntity todo) async {
    final updatedTodo = todo.toggleCompletion();
    
    await todoRepo.updateTodo(updatedTodo);

    // Refresh the list after updating
    loadTodos();
  }
}