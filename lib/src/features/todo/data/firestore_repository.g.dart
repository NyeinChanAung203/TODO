// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fireStoreHash() => r'ebd635c080284ee744da7a5b41366533c0d83030';

/// See also [fireStore].
@ProviderFor(fireStore)
final fireStoreProvider = Provider<FirebaseFirestore>.internal(
  fireStore,
  name: r'fireStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fireStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FireStoreRef = ProviderRef<FirebaseFirestore>;
String _$firestoreRepositoryHash() =>
    r'7bbd1c6984811014be651f01f180d4fcea3b31d8';

/// See also [firestoreRepository].
@ProviderFor(firestoreRepository)
final firestoreRepositoryProvider = Provider<FireStoreRepository>.internal(
  firestoreRepository,
  name: r'firestoreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firestoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreRepositoryRef = ProviderRef<FireStoreRepository>;
String _$todosHash() => r'fc72a0077dcb850943b41c015a8b4185cbc1d584';

/// See also [todos].
@ProviderFor(todos)
final todosProvider = StreamProvider<List<Todo>>.internal(
  todos,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodosRef = StreamProviderRef<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
