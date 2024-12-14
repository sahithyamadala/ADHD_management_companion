// lib/home_screen.dart
import 'package:flutter/material.dart';
import 'reminders_screen.dart';
import 'goal_setting_screen.dart'; // Import Goal Setting screen
import 'progress_screen.dart'; // Import Progress screen
import 'education_screen.dart'; // Import Education screen
import 'symptom_log_screen.dart'; // Import Symptom Log screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, Superhero! 🦸‍♂✨',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(
              icon: Icons.favorite,
              title: 'Symptom Log',
              color: Colors.pinkAccent,
              onTap: () {
                // Navigate to Symptom Log page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SymptomLogScreen()), // Navigate to Symptom Log screen
                );
              },
            ),
            SizedBox(height: 12),
            _buildCard(
              icon: Icons.show_chart,
              title: 'Progress',
              color: Colors.blueAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProgressScreen()), // Navigate to Progress screen
                );
              },
            ),
            SizedBox(height: 12),
            _buildCard(
              icon: Icons.alarm,
              title: 'Reminders',
              color: Colors.greenAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RemindersScreen()),
                );
              },
            ),
            SizedBox(height: 12),
            _buildCard(
              icon: Icons.flag,
              title: 'Goal Setting',
              color: Colors.orangeAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GoalSettingScreen()), // Navigate to Goal Setting screen
                );
              },
            ),
            SizedBox(height: 12),
            _buildCard(
              icon: Icons.school, // Changed icon to a more fitting one
              title: 'Education',
              color: Colors.purpleAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EducationScreen()), // Navigate to Education screen
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
