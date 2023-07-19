import 'package:flutter/material.dart';

import '../constant.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: grey2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'More'.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
