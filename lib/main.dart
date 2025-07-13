import 'package:flutter/material.dart';
import 'package:flutter_go_example/router/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void login(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setIsAuthenticated(true);
  }

  static void logout(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setIsAuthenticated(false);
  }
}

class _MyAppState extends State<MyApp> {
  bool isAuthenticated = false;

  void setIsAuthenticated(bool value) {
    setState(() {
      isAuthenticated = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getRouter(isAuthenticated),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
    );
  }
}
