import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudge_finance/controllers/usercontroller.dart';
import 'package:fudge_finance/views/transaction.dart';
import 'package:get/get.dart';

import '../utilities/constant.dart';
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
      body: Column(
        children: [
          const UserAndStatsPanel(),
          Expanded(
            child: ListView(
              children: [
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
                Obx(
                  () => Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 75,
                    child: _userController.users.isEmpty
                        ? const Center(child: CupertinoActivityIndicator())
                        : ListView.separated(
                            separatorBuilder: (_, i) => const SizedBox(
                              width: 20,
                            ),
                            itemCount: _userController.users.length,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return UserWidget(
                                name: _userController.users[index].username ??
                                    'N/A',
                              );
                            },
                          ),
                  ),
                ),
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
                ListView.separated(
                  separatorBuilder: (ctx, i) => const SizedBox(
                    height: 20,
                  ),
                  shrinkWrap: true,
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return RecentTransactionWidget(index: index);
                  },
                ),
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
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LinearProgressWidget(color: pink1, progress: 0.75),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LinearProgressWidget(color: cyan1, progress: 0.60),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserAndStatsPanel extends StatelessWidget {
  const UserAndStatsPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            Row(
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
                  'assets/images/bell.svg',
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
            const SizedBox(height: 30),
            const Text(
              '\$56,271.68',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
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
                      'assets/images/arrow_up.svg',
                      colorFilter: ColorFilter.mode(green1, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 6.5),
                    Text(
                      '2.3%',
                      style: TextStyle(
                        color: green1,
                        fontSize: 15 * Config(context).textScaleFactor,
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
                fontSize: 11 * Config(context).textScaleFactor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatsWidget(number: '12', title: 'Following'),
                VerticalDivider(color: Colors.white),
                StatsWidget(number: '36', title: 'Transactions'),
                VerticalDivider(color: Colors.white),
                StatsWidget(number: '4', title: 'Bills'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

class StatsWidget extends StatelessWidget {
  const StatsWidget({
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
