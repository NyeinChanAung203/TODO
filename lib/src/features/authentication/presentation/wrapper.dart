import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/features/authentication/data/auth_repository.dart';
import 'package:todo/src/features/authentication/presentation/auth_screen.dart';
import 'package:todo/src/features/todo/presentation/todos/todos_page.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('build wrapper');
    final authStateChanges = ref.watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (User? user) {
        if (user != null) {
          return const TodoListPage();
        } else {
          return const AuthScreen();
        }
      },
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
