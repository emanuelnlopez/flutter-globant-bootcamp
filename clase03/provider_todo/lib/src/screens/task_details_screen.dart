import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/src/model/task.dart';
import 'package:provider_todo_list/src/model/task_list_state.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({
    super.key,
    this.task,
  });

  final Task? task;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _textController.text = widget.task!.text;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.task == null ? 'Create Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  if (widget.task == null) {
                    context
                        .read<TaskListState>()
                        .add(Task(text: _textController.text));
                  } else {
                    context.read<TaskListState>().update(
                          widget.task!.copyWith(text: _textController.text),
                        );
                  }
                  Navigator.pop(context);
                }
              },
              child: Text(widget.task == null ? 'Create' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
