import 'package:flutter/material.dart';
import 'package:fudge_finance/models/recent_transaction_model.dart';

import '../constant.dart';

class RecentTransactionWidget extends StatelessWidget {
  const RecentTransactionWidget(
      {Key? key, required this.recentTransactionModel})
      : super(key: key);

  final RecentTransactionModel recentTransactionModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          recentTransactionModel.logo,
          height: 35,
          width: 35,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(recentTransactionModel.name),
            const SizedBox(height: 3),
            Text(
              recentTransactionModel.country,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(recentTransactionModel.amount),
            const SizedBox(height: 3),
            Text(
              recentTransactionModel.date,
              style: const TextStyle(
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
          recentTransactionModel.isProcessing
              ? ImageAssets.processCircle
              : ImageAssets.checkCircle,
          height: 12,
          width: 12,
        ),
      ],
    );
  }
}
