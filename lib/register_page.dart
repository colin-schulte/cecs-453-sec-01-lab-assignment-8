// Lab assignment 8 - Firebase Database
// Group: Colin Schulte, Dylan Schulte
// register_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authProvider.register(
                  _emailController.text.trim(),
                  _passwordController.text.trim(),
                );

                if (mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Create Account'),
            ),
            ElevatedButton(
              onPressed: () async {
                await authProvider.signInWithGoogle();
              },
              child: const Text('Sign In With Google'),
            ),
          ],
        ),
      ),
    );
  }
}
