import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/utils/async_value_alert.dart';
import 'package:todo/src/utils/form_validator.dart';

import '../controllers/auth_controller.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtrl = useTextEditingController();
    final passwordCtrl = useTextEditingController();
    final state = ref.watch(authControllerProvider);
    final formKey = GlobalKey<FormState>();
    final isSignUp = useState(false);
    ref.listen<AsyncValue>(authControllerProvider,
        (_, state) => state.showAlertDialogOnError(context));
    return Scaffold(
      appBar: AppBar(
        title: isSignUp.value ? const Text('Sign Up') : const Text('Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: FormValidator.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const Gap(
                  24,
                ),
                TextFormField(
                  controller: passwordCtrl,
                  decoration: const InputDecoration(hintText: 'Password'),
                  validator: FormValidator.validatePassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const Gap(
                  24,
                ),
                ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () async {
                            if (formKey.currentState!.validate()) {
                              isSignUp.value
                                  ? await ref
                                      .read(authControllerProvider.notifier)
                                      .signUp(
                                          email: emailCtrl.text.trim(),
                                          password: passwordCtrl.text.trim())
                                  : await ref
                                      .read(authControllerProvider.notifier)
                                      .signIn(
                                          email: emailCtrl.text.trim(),
                                          password: passwordCtrl.text.trim());
                            }
                          },
                    child: state.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator())
                        : isSignUp.value
                            ? const Text('Sign Up')
                            : const Text('Sign In')),
                const Gap(32),
                TextButton(
                    onPressed: () {
                      isSignUp.value = !isSignUp.value;
                    },
                    child: isSignUp.value
                        ? const Text('Have an account? Sign In')
                        : const Text('Need an account? Sign Up'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
