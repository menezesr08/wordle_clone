import 'package:flutter/material.dart';

class WordleLetterbox extends StatelessWidget {
  final String letter;
  final String correctWord;
  final bool attempted;
  final int index;

  const WordleLetterbox(
      {Key? key,
      required this.index,
      required this.letter,
      required this.correctWord,
      required this.attempted})
      : super(key: key);

  Color? getBgColor() {
    if (!attempted) {
      return null;
    }

    if (!correctWord.contains(letter)) {
      return Colors.grey;
    }

    if (correctWord.indexOf(letter) == index) {
      return Colors.green;
    }

    return Colors.orangeAccent;
  }

  BoxBorder? getBorder() {
    if (!attempted) {
      return Border.all(
        color: Colors.grey,
        width: 2,
      );
    }

    return Border.all(color: Colors.transparent, width: 2);
  }

  Color? getTextColor() {
    if (!attempted) {
      return Colors.black87;
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: getBorder(),
          color: getBgColor()),
      child: Text(
        letter.toUpperCase(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: getTextColor()),
      ),
    );
  }
}
