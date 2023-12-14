import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/screens/home_screen.dart';
import 'package:flutter_exam/screens/login_screen.dart';

GlobalKey<NavigatorState> navigationApp =
    GlobalKey<NavigatorState>(debugLabel: "navigationApp");

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationApp,
      title: 'Fluter Exam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      },
      initialRoute: '/login',
    );
  }
}
