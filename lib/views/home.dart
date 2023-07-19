import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudge_finance/controllers/usercontroller.dart';
import 'package:fudge_finance/models/test_data.dart';
import 'package:fudge_finance/views/transaction.dart';
import 'package:get/get.dart';

import '../utilities/constant.dart';
import '../utilities/widgets/button.dart';
import '../utilities/widgets/chart.dart';
import '../utilities/widgets/linear_progress.dart';
import '../utilities/widgets/recent_transaction.dart';
import '../utilities/widgets/user_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar that shows user details
      appBar: userHeader(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatsPanel(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Performance Chart'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const MoreButton(),
                ],
              ),
            ),
            const ChatWidget(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'TOP USERS FROM YOUR COMMUNITY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),

            // Below Widget renders the user list
            TopUserView(userController: _userController),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'RECENT TRANSACTIONS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // For navigating to Transaction screen

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TransactionView();
                          },
                        ),
                      );
                    },
                    child: const MoreButton(),
                  ),
                ],
              ),
            ),

            // Below Widget renders the transaction list
            const RecentTransactionsShortView(),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'FINANCIAL GOALS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressWidget(color: blue2, progress: 0.3),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressWidget(color: pink1, progress: 0.75),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressWidget(color: cyan1, progress: 0.60),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  AppBar userHeader() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: blue1,
      titleSpacing: 0,
      toolbarHeight: 80,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: blue1,
        ),
        child: Row(
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hola, Michael',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Te tenemos excelentes noticias para ti',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              ImageAssets.bell,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            const SizedBox(width: 20),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(womanStandingNearBlueGateUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Shows Top User View
class TopUserView extends StatelessWidget {
  const TopUserView({
    super.key,
    required UserController userController,
  }) : _userController = userController;

  final UserController _userController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: 20),
        height: 75,
        child: _userController.users.isEmpty
            ? const Center(child: CupertinoActivityIndicator())
            : ListView.separated(
                separatorBuilder: (ctx, i) => const SizedBox(width: 20),
                itemCount: _userController.users.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return UserWidget(
                    name: _userController.users[index].username ?? 'N/A',
                  );
                },
              ),
      ),
    );
  }
}

class RecentTransactionsShortView extends StatelessWidget {
  const RecentTransactionsShortView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (ctx, i) => const SizedBox(height: 20),
      shrinkWrap: true,
      itemCount: 5,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        return RecentTransactionWidget(
          recentTransactionModel: recentTransactionList[index],
        );
      },
    );
  }
}

class StatsPanel extends StatelessWidget {
  const StatsPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: blue1,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // const SizedBox(height: 30),
            const Text(
              '\$56,271.68',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 5),
                const Text(
                  '+\$9,736',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      ImageAssets.arrowUp,
                      colorFilter: ColorFilter.mode(green1, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 6.5),
                    Text(
                      '2.3%',
                      style: TextStyle(
                        color: green1,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 5),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'ACCOUNT BALANCE',
              style: TextStyle(
                color: grey1,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatsBottomWidget(number: '12', title: 'Following'),
                  VerticalDivider(color: Colors.white),
                  StatsBottomWidget(number: '36', title: 'Transactions'),
                  VerticalDivider(color: Colors.white),
                  StatsBottomWidget(number: '4', title: 'Bills'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatsBottomWidget extends StatelessWidget {
  const StatsBottomWidget({
    super.key,
    required this.title,
    required this.number,
  });

  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18 * Config(context).textScaleFactor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: grey1,
            fontSize: 12 * Config(context).textScaleFactor,
          ),
        )
      ],
    );
  }
}
