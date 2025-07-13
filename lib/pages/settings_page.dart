import 'package:flutter/material.dart';
import 'package:flutter_go_example/main.dart';
import 'package:flutter_go_example/models/user.dart';
import 'package:flutter_go_example/router/routes.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = User(name: 'HeyFlutter', email: 'hello@heyflutter.com');

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is Settings Page', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () =>
                  context.push(Routes.settingsProfilePage, extra: user),
              child: const Text('View Profile Page'),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () => context.push(Routes.detailsPage, extra: user),
              child: const Text('View Details Page'),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () => MyApp.logout(context),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
