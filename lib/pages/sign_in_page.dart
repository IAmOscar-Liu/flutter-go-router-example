import 'package:flutter/material.dart';
import 'package:flutter_go_example/main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Flutter go_router demo',
              style: TextStyle(fontSize: 20),
            ),
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
