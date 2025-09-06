/*

  Todo View
  Is responsible for displaying the list of todos and providing UI for adding, deleting, and toggling completion status.
  It interacts with the TodoCubit to manage state and handle user actions.

*/


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';
import 'package:todo_app/features/todo/presentation/state/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key, required TodoRepo todoRepo});

  void _showAddTodoBox(BuildContext context) {
    // Logic to show a dialog for adding a new todo
    final TodoCubit todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          // Cancel button
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),

          // Add button
          TextButton(
            onPressed: () {
              todoCubit.addTodo (textController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    final todoCubit = context.read<TodoCubit>();

    return  Scaffold(
      //Floating action button to add new todo
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoBox(context),
      ),
      //BLOC Builder to listen to TodoCubit state changes
      body: BlocBuilder<TodoCubit, List<TodoEntity>>(
        builder: (context, todos) {
          // ListView to display todos
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // Each todo item
              final todo = todos[index];

              return ListTile(
                // Text 
                title: Text(
                  todo.text,
                  style: TextStyle(
                    decoration: todo.isComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),

                // Checkbox to toggle completion
                leading: Checkbox(
                  value: todo.isComplete,
                  onChanged: (value) => todoCubit.toggleCompletion(todo),
                  
                ),

                // Delete button
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => todoCubit.deleteTodo(todo),
      
                ),
              );
            },
          );
        },
      ),
    );
  }
}
