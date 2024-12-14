import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(SequenceSafari());
}

class SequenceSafari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sequence Safari',
      home: SafariGame(),
    );
  }
}

class SafariGame extends StatefulWidget {
  @override
  _SafariGameState createState() => _SafariGameState();
}

class _SafariGameState extends State<SafariGame> {
  List<String> sequence = [];
  List<String> playerSequence = [];
  int level = 1;
  bool gameStarted = false;
  bool showMessage = false;
  String message = '';

  // Animal image list to display and tap
  final List<String> animals = [
    'lion',
    'tiger',
    'elephant',
    'zebra',
    'giraffe',
    'rhino',
    'bear',
    'monkey',
    'panda',
    'fox',
    'wolf',
    'koala'
  ];

  final Map<String, String> animalImages = {
    'lion': 'assets/images/lion.png',
    'tiger': 'assets/images/tiger.png',
    'elephant': 'assets/images/elephant.png',
    'zebra': 'assets/images/zebra.png',
    'giraffe': 'assets/images/giraffe.png',
    'rhino': 'assets/images/rhino.png',
    'bear': 'assets/images/bear.png',
    'monkey': 'assets/images/monkey.png',
    'panda': 'assets/images/panda.png',
    'fox': 'assets/images/fox.png',
    'wolf': 'assets/images/wolf.png',
    'koala': 'assets/images/koala.png',
  };

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    setState(() {
      sequence = generateSequence(level);
      playerSequence = [];
      gameStarted = false;
      showMessage = false;
    });
    Future.delayed(Duration(seconds: 1), () {
      showSequence();
    });
  }

  List<String> generateSequence(int level) {
    int sequenceLength;
    if (level == 1) {
      sequenceLength = 3; // Level 1 has 3 images
    } else if (level == 2) {
      sequenceLength = 5; // Level 2 has 5 images
    } else if (level == 3) {
      sequenceLength = 7; // Level 3 has 7 images
    } else if (level == 4) {
      sequenceLength = 9; // Level 4 has 9 images
    } else {
      sequenceLength = 12; // Level 5 has 12 images
    }

    // Randomly shuffle selected animals for the sequence
    List<String> newSequence = [];
    List<String> availableAnimals = List.from(animals.take(sequenceLength));
    while (availableAnimals.isNotEmpty) {
      int randomIndex = Random().nextInt(availableAnimals.length);
      newSequence.add(availableAnimals[randomIndex]);
      availableAnimals.removeAt(randomIndex);
    }
    return newSequence;
  }

  void showSequence() async {
    setState(() {
      gameStarted = false;
    });

    for (String animal in sequence) {
      setState(() {
        message = 'Watch: $animal';
      });
      await Future.delayed(Duration(seconds: 1));
    }

    setState(() {
      message = 'Your turn!';
      gameStarted = true;
    });
  }

  void checkPlayerInput(String animal) {
    if (!gameStarted) return;

    setState(() {
      playerSequence.add(animal);
    });

    if (sequence[playerSequence.length - 1] != animal) {
      setState(() {
        message = 'Try again!';
        playerSequence = [];
        showMessage = true;
        gameStarted = false;
      });
      Future.delayed(Duration(seconds: 2), () {
        startGame();
      });
    } else if (playerSequence.length == sequence.length) {
      if (level < 5) {
        setState(() {
          message = 'Level $level completed!'; // Update level up message
          showMessage = true;
          level++;
        });
        Future.delayed(Duration(seconds: 2), () {
          startGame();
        });
      } else {
        setState(() {
          message =
              'Hurray! You can do anything! Good move, champ!'; // Final message
          showMessage = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sequence Safari - Level $level'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 24),
          ),
          if (showMessage)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
            ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: animals
                  .take(level == 1
                      ? 3
                      : level == 2
                          ? 5
                          : level == 3
                              ? 7
                              : level == 4
                                  ? 9
                                  : 12)
                  .map((animal) {
                return GestureDetector(
                  onTap: () {
                    if (gameStarted) {
                      checkPlayerInput(animal);
                    }
                  },
                  child: Image.asset(
                    animalImages[animal]!,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
