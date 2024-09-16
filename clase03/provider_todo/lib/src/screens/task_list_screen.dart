import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/src/model/task.dart';
import 'package:provider_todo_list/src/model/task_list_state.dart';
import 'package:provider_todo_list/src/screens/task_details_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskListState>().tasks;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Provider task list'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => TaskItem(
          task: tasks[index],
        ),
        separatorBuilder: (context, index) => const Divider(
          endIndent: 16.0,
          height: 1.0,
          indent: 16.0,
          thickness: 1.0,
        ),
        itemCount: tasks.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TaskDetailsScreen()),
        ),
        label: const Text('Create Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Checkbox(
          value: task.done,
          onChanged: (_) => context.read<TaskListState>().toggle(task),
        ),
        title: Text(
          task.text,
          style: TextStyle(
            decoration: task.done ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(DateTime.fromMillisecondsSinceEpoch(task.id).toString()),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => context.read<TaskListState>().delete(task),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(task: task),
          ),
        ),
      );
}
