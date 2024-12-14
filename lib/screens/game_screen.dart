import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/memory_card.dart'; // Adjust the import path as needed

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  final List<String> cardImages = [
    'assets/potion.png',
    'assets/potion.png',
    'assets/crystal.png',
    'assets/crystal.png',
    'assets/scroll.png',
    'assets/scroll.png',
    'assets/spellbook.png', // New images added
    'assets/spellbook.png',
    'assets/orb.png', // New images added
    'assets/orb.png',
    'assets/wand.png', // New images added
    'assets/wand.png',
  ];
  List<bool> isFlipped = List.generate(12, (index) => false);
  List<int> matchedPairs = [];
  int score = 0;
  late AnimationController _controller;
  bool showCongratulations = false;
  bool showMatchMessage = false;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    cardImages.shuffle();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _resetGame() {
    setState(() {
      isFlipped = List.generate(12, (index) => false);
      matchedPairs.clear();
      score = 0;
      showCongratulations = false;
      cardImages.shuffle(); // Shuffle cards again for a new game
    });
  }
  void _onCardTapped(int index) {
    if (isFlipped[index] || matchedPairs.contains(index)) return;

    setState(() {
      isFlipped[index] = true;
    });

    final flippedIndices = isFlipped
        .asMap()
        .entries
        .where((entry) => entry.value && !matchedPairs.contains(entry.key))
        .map((entry) => entry.key)
        .toList();

    if (flippedIndices.length == 2) {
      if (cardImages[flippedIndices[0]] == cardImages[flippedIndices[1]]) {
        // Cards match
        _showSparkleEffect("Pair matched!");
        Fluttertoast.showToast(
            msg: "Pair matched!", toastLength: Toast.LENGTH_SHORT);

        _controller.forward().then((value) {
          setState(() {
            matchedPairs.addAll(flippedIndices);
            // Increment score based on the number of matched pairs
            if (matchedPairs.length <= 8) {
              score += 20; // First four pairs (indices 0-7)
            } else {
              score += 10; // Last two pairs (indices 8-11)
            }

            // Show congratulations message if all pairs are matched
            if (matchedPairs.length == cardImages.length) {
              showCongratulations = true;
              Fluttertoast.showToast(
                  msg: "Congratulations! Bravo!! You did it!!!",
                  toastLength: Toast.LENGTH_SHORT);
            }
          });
          _controller.reverse();
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isFlipped[flippedIndices[0]] = false;
            isFlipped[flippedIndices[1]] = false;
          });
        });
      }
    }
  }

  void _showSparkleEffect(String message) {
    setState(() {
      showMatchMessage = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showMatchMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Quest: Wizard\'s Workshop'),
      ),
      body: Column(
        children: [
          Text('Score: $score', style: const TextStyle(fontSize: 24)),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: cardImages.length,
              itemBuilder: (context, index) {
                return MemoryCard(
                  imagePath: cardImages[index],
                  isFlipped: isFlipped[index],
                  onTap: () => _onCardTapped(index),
                );
              },
            ),
          ),
          if (showMatchMessage) _buildSparkleMessage("Pair matched!"),
          if (showCongratulations)
            FadeTransition(
              opacity: _controller,
              child: _buildSparkleMessage(
                  "Congratulations! Bravo!! You did it!!!"),
            ),
          if (showCongratulations)
            ElevatedButton(
              onPressed: _resetGame,
              child: const Text("Play Again"),
            ),
        ],
      ),
    );
  }

  Widget _buildSparkleMessage(String message) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: AnimatedOpacity(
        opacity: showMatchMessage || showCongratulations ? 1.0 : 0.0,
        duration: const Duration(seconds: 1),
        child: Text(
          message,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
