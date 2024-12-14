import 'package:flutter/material.dart';

class MemoryCard extends StatelessWidget {
  final String imagePath;
  final bool isFlipped;
  final VoidCallback onTap;

  const MemoryCard({
    Key? key,
    required this.imagePath,
    required this.isFlipped,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isFlipped
            ? Image.asset(imagePath, fit: BoxFit.cover)
            : Container(color: Colors.blue), // Placeholder for unflipped state
      ),
    );
  }
}
