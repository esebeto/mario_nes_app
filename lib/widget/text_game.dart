import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var gameFont = GoogleFonts.pressStart2p(
  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
);

class TextGame extends StatelessWidget {
  final String title;
  final String description;

  const TextGame({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: gameFont),
        const SizedBox(height: 10),
        Text(
          description,
          style: gameFont,
        ),
      ],
    );
  }
}
