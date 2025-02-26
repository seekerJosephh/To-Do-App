import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/providers/task_provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To-Do List"),
        ),
        body: Consumer<TaskProvider>(
          builder: (context, taskProvider, child) {
            return ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      taskProvider.toggleTaskCompletion(index);
                    },
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      taskProvider.removeTask(index);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTaskDialog(context),
          child: Icon(Icons.add),
        ));
  }

  void _showAddTaskDialog(BuildContext context) {
    TextEditingController taskController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Task'),
            content: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: "Enter Task name"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (taskController.text.isNotEmpty) {
                    Provider.of<TaskProvider>(context, listen: false)
                        .addTask(taskController.text);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add'),
              ),
            ],
          );
        });
  }
}


// Username 
// Password 6 