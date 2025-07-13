import 'package:flutter/material.dart';
import 'package:flutter_go_example/models/user.dart';
import 'package:flutter_go_example/router/routes.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = User(name: 'HeyFlutter', email: 'hello@heyflutter.com');

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is Details Page', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () =>
                  context.go(Routes.settingsProfilePage, extra: user),
              child: const Text('View Profile Page'),
            ),
          ],
        ),
      ),
    );
  }
}
