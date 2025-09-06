/*
  Page for displaying and managing todo items.
  It uses the TodoCubit to handle state and user interactions.
  The UI includes a list of todos and a text field for adding new ones.

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';
import 'package:todo_app/features/todo/presentation/state/todo_cubit.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_view.dart';


class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;

  const TodoPage({super.key, required this.todoRepo});

  
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (context) => TodoCubit(todoRepo),
      child: TodoView(todoRepo: todoRepo),
    );
  }
}