import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../core/theme/app_colors.dart';
import '../domain/auth_notifier.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  FormGroup buildForm() => fb.group({
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        'password': FormControl<String>(
          validators: [Validators.required, Validators.minLength(8)],
        ),
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ReactiveFormBuilder(
              form: buildForm,
              builder: (context, form, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.health_and_safety,
                        size: 64, color: AppColors.primary),
                    const SizedBox(height: 24),
                    Text(
                      'Welcome to HealthChain',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to access clinical and supply networks',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.mutedForeground,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    if (authState.errorMessage != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: AppColors.destructive.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColors.destructive.withOpacity(0.3)),
                        ),
                        child: Text(
                          authState.errorMessage!,
                          style: const TextStyle(color: AppColors.destructive),
                        ),
                      ),
                    ReactiveTextField<String>(
                      formControlName: 'email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Institutional Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'The email must not be empty',
                        ValidationMessage.email: (error) =>
                            'The email value must be a valid email',
                      },
                    ),
                    const SizedBox(height: 16),
                    ReactiveTextField<String>(
                      formControlName: 'password',
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _handleSubmit(form, ref, context),
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'The password must not be empty',
                        ValidationMessage.minLength: (error) =>
                            'The password must be at least 8 characters long',
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: (form.valid && !authState.isLoading)
                          ? () => _handleSubmit(form, ref, context)
                          : null,
                      child: authState.isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text('Sign In to Dashboard'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit(
      FormGroup form, WidgetRef ref, BuildContext context) async {
    if (form.valid) {
      final email = form.control('email').value as String;
      final password = form.control('password').value as String;

      final success =
          await ref.read(authProvider.notifier).login(email, password);
      if (success) {
        if (context.mounted) context.go('/home');
      }
    } else {
      form.markAllAsTouched();
    }
  }
}
