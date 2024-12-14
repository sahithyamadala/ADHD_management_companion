import 'package:flutter/material.dart';
import 'sequence_safari_screen.dart';
import 'screens/game_home_page.dart'; // Correct import for the GameHomepage

class SymptomLogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Log'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Updated message text
            Text(
              'Hey Buddy! Here you can improve yourself!!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple, // Change text color if needed
              ),
            ),
            SizedBox(height: 40), // Space between the text and the buttons

            // Sequence Safari button
            ElevatedButton(
              onPressed: () {
                // Navigate to the Sequence Safari screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SequenceSafari()), // Replace with your screen
                );
              },
              child: Text('Go to Sequence Safari'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Make button bigger
                textStyle: TextStyle(
                  fontSize: 18, // Make the text inside the button larger
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Memory Quest button
            SizedBox(height: 20), // Space between the buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to the GameHomepage (Memory Quest screen)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameHomepage()), // Navigate to GameHomepage screen
                );
              },
              child: Text('Memory Quest'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color for Memory Quest
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Make button bigger
                textStyle: TextStyle(
                  fontSize: 18, // Make the text inside the button larger
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
