import 'package:flutter/material.dart';
import 'package:flutter_go_example/main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is Sign-in Page', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                MyApp.login(context);
              },
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
