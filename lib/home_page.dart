import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab_assignment_8/auth_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final authRepo = context.watch<AuthRepository>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authRepo.signOut(),
          ),
        ],
      ),
      body: Center(child: Text("Welcome, ${authRepo.user?.email}")),
    );
  }
}
