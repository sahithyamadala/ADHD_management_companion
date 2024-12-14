// lib/main.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'education_screen.dart';
import 'goal_setting_screen.dart';
import 'reminders_screen.dart';
import 'symptom_log_screen.dart'; // Import the Symptom Log screen
import 'notifications_helper.dart'; // Import the notifications helper

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notifications
  await initNotifications(); // Await the initialization

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADHD Management Companion',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/reminders': (context) => RemindersScreen(),
        '/goal-setting': (context) => GoalSettingScreen(),
        '/education': (context) => EducationScreen(),
        '/symptom-log': (context) => SymptomLogScreen(), // Add Symptom Log screen route
      },
    );
  }
}
