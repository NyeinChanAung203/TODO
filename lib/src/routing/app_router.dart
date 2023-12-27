import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/src/features/authentication/presentation/auth_screen.dart';
import 'package:todo/src/features/authentication/presentation/wrapper.dart';
import 'package:todo/src/features/profile/presentation/profile_screen.dart';

part 'app_router.g.dart';

enum Routes { root, auth, profile }

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: Routes.root.name,
          builder: (context, state) => const Wrapper(),
          routes: [
            GoRoute(
              path: 'auth',
              name: Routes.auth.name,
              builder: (context, state) => const AuthScreen(),
            ),
            GoRoute(
              path: 'profile',
              name: Routes.profile.name,
              builder: (context, state) => const ProfileScreen(),
            ),
          ]),
    ],
  );
}
