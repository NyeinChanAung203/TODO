import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/features/todo/domain/todo.dart';

import '../../controllers/todo_controller.dart';

class TodoCard extends ConsumerWidget {
  const TodoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('build card');
    Todo todo = ref.watch(todoSingleProvider);
    return Card(
      color: todo.isDone ? Colors.blueGrey.shade100 : Colors.white,
      child: ListTile(
        dense: true,
        isThreeLine: true,
        onTap: () {
          ref.read(todoControllerProvider.notifier).toggleDone(todo);
        },
        onLongPress: () {
          ref.read(todoControllerProvider.notifier).deleteTodo(todo.id);
        },
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          todo.description ?? '',
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Text(
          DateFormat().add_MMMEd().format(todo.createdAt).toString(),
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
