// Lab assignment 8 - Firebase Database
// Group: Colin Schulte, Dylan Schulte
// home_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authProvider.logout(),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome ${authProvider.user?.email ?? ""}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
