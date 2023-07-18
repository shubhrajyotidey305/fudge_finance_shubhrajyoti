import 'package:flutter/material.dart';

class RecentTransactionWidget extends StatelessWidget {
  const RecentTransactionWidget({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/user_profile.png',
          height: 35,
          width: 35,
        ),
        const SizedBox(
          width: 16,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'John Doe',
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'United Kingdom',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '80,000 AED',
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '11 Aug 2021',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Image.asset(
          index == 0
              ? 'assets/images/in_progress.png'
              : 'assets/images/check_circle_fill.png',
          height: 12,
          width: 12,
        ),
      ],
    );
  }
}
