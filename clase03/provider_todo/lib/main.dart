import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/src/model/task_list_state.dart';
import 'package:provider_todo_list/src/screens/task_list_screen.dart';

void main() => runApp(const TodoListApp());

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskListState(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        title: 'Provider task list',
        home: const TaskListScreen(),
      ),
    );
  }
}
