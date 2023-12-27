import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/src/features/todo/domain/todo.dart';

part 'firestore_repository.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore fireStore(FireStoreRef ref) {
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
FireStoreRepository firestoreRepository(FirestoreRepositoryRef ref) {
  final firestore = ref.watch(fireStoreProvider);
  return FireStoreRepository(firestore: firestore);
}

@Riverpod(keepAlive: true)
Stream<List<Todo>> todos(TodosRef ref) {
  final fireStoreRepo = ref.watch(firestoreRepositoryProvider);
  return fireStoreRepo.allTodos();
}

enum Collections {
  todos,
}

class FireStoreRepository {
  FireStoreRepository({required this.firestore});

  final FirebaseFirestore firestore;

  Future<void> createTodo(Todo todo) async {
    return firestore
        .collection(Collections.todos.name)
        .doc(todo.id)
        .set(todo.toMap());
  }

  Future<void> updateTodo(Todo todo) async {
    return firestore
        .collection(Collections.todos.name)
        .doc(todo.id)
        .update(todo.toMap());
  }

  Future<void> deleteTodo(String id) async {
    return firestore.collection(Collections.todos.name).doc(id).delete();
  }

  Stream<List<Todo>> allTodos() {
    return firestore
        .collection(Collections.todos.name)
        .snapshots()
        .map((event) => event.docs
            .map(
              (docSnapshot) => Todo.fromMap(docSnapshot.data()),
            )
            .toList());
  }
}
