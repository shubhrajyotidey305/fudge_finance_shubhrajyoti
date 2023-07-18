import 'package:flutter/material.dart';

import '../constant.dart';

class LinearProgressWidget extends StatelessWidget {
  final Color color;
  final double progress;
  const LinearProgressWidget({
    Key? key,
    required this.color,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'XX of total XX',
          style: TextStyle(
            color: grey3,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        LinearProgressIndicator(
          color: color,
          value: progress,
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
        )
      ],
    );
  }
}
