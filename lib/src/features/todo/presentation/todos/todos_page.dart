import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/features/authentication/controllers/auth_controller.dart';
import 'package:todo/src/features/todo/controllers/todo_controller.dart';
import 'package:todo/src/features/todo/data/firestore_repository.dart';
import 'package:todo/src/features/todo/presentation/todos/todo_card.dart';
import 'package:todo/src/routing/app_router.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('build todos page');
    final todos = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
              onPressed: () {
                context.goNamed(Routes.profile.name);
                // ref.read(authControllerProvider.notifier).singOut();
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () {
                // context.goNamed(Routes.profile.name);
                ref.read(authControllerProvider.notifier).singOut();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: todos.when(
          data: (data) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final todo = data[index];
                    return ProviderScope(overrides: [
// ignore: scoped_providers_should_specify_dependencies
                      todoSingleProvider.overrideWithValue(todo),
                    ], child: const TodoCard());
                  },
                  itemCount: data.length,
                ),
              ),
          error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(todoControllerProvider.notifier)
              .createTodo(title: 'this istitlei', description: 'des');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
