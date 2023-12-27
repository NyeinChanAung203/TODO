import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/src/features/authentication/data/auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({required String email, required String password}) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authRepository.signIn(email: email, password: password));
  }

  Future<void> signUp({required String email, required String password}) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authRepository.signUp(email: email, password: password));
  }

  Future<void> singOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}
