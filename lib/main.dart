import 'package:flutter/material.dart';
import 'package:task_project/log_in_screen.dart';

void main() {
  runApp(const Learnova());
}

class Learnova extends StatelessWidget {
  const Learnova({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(390, 56),
            backgroundColor: Color(0xFF0A5ED7),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ),
    );
  }
}


