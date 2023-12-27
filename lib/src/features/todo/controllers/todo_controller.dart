import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/src/features/todo/data/firestore_repository.dart';

import '../domain/todo.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  @override
  FutureOr<void> build() {}

  Future<void> createTodo(
      {required String title, required String? description}) async {
    final fireStoreRepo = ref.read(firestoreRepositoryProvider);
    final todo = Todo.create(title, description);
    state = const AsyncValue.loading();
    await AsyncValue.guard(() => fireStoreRepo.createTodo(todo));
  }

  Future<void> updateTodo(Todo todo) async {
    final fireStoreRepo = ref.read(firestoreRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => fireStoreRepo.updateTodo(todo));
  }

  Future<void> toggleDone(Todo todo) async {
    final fireStoreRepo = ref.read(firestoreRepositoryProvider);
    final newTodo = todo.copyWith(isDone: !todo.isDone);
    await AsyncValue.guard(() => fireStoreRepo.updateTodo(newTodo));
  }

  Future<void> deleteTodo(String id) async {
    final fireStoreRepo = ref.read(firestoreRepositoryProvider);
    state = await AsyncValue.guard(() => fireStoreRepo.deleteTodo(id));
  }
}

// for single todo
@riverpod
Todo todoSingle(TodoSingleRef ref) {
  return throw UnimplementedError();
}
