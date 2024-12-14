import 'package:flutter/material.dart'; // Ensure this import is present
import 'game_screen.dart'; // Ensure GameScreen is defined here

class GameHomepage extends StatelessWidget {
  // Constructor
  const GameHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memory Quest: Wizard\'s Workshop')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()), // Correct usage of MaterialPageRoute
                );
              },
              child: Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
