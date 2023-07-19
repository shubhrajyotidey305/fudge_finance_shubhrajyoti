import 'package:flutter/material.dart';

class SavedCardWidget extends StatelessWidget {
  const SavedCardWidget({Key? key, required this.card}) : super(key: key);

  final String card;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      card,
    );
  }
}
