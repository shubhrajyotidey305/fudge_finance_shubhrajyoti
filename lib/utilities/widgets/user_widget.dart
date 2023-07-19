import 'package:flutter/material.dart';

import '../constant.dart';

class UserWidget extends StatelessWidget {
  final String name;
  const UserWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image.asset(
              ImageAssets.user,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
