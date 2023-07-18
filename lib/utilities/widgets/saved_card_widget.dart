import 'package:flutter/material.dart';

class SavedCardWidget extends StatelessWidget {
  const SavedCardWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/visa_card${index % 2 + 1}.png',
    );
  }
}
