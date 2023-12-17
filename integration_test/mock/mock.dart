import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockHomeScreen extends StatelessWidget {
  final Widget? child;

  const MockHomeScreen({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: child ?? const Text("HOME SCREEN")));
}
