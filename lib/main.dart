import 'package:flutter/material.dart';
import 'package:flutter_go_example/router/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void login(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.login();
  }

  static void logout(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.logout();
  }
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  bool isLoading = true;
  dynamic error;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void login() {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        isLoggedIn = true;
      });
    });
  }

  void logout() {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        isLoggedIn = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getRouter(
        isLoading: isLoading,
        error: error,
        isLoggedIn: isLoggedIn,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
    );
  }
}
