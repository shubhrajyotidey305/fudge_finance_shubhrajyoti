import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudge_finance/models/test_data.dart';

import '../utilities/constant.dart';
import '../utilities/widgets/page_indicator.dart';
import '../utilities/widgets/recent_transaction.dart';
import '../utilities/widgets/saved_card_widget.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                ImageAssets.arrowRight,
                height: 12,
                width: 12,
              ),
            ),
            const Text(
              'My saved cards',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(
            ImageAssets.menu,
            height: 12,
            width: 12,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            CardView(pageController: _pageController),
            const SizedBox(height: 20),
            PageIndicator(totalPage: 2, pageController: _pageController),
            const SizedBox(height: 20),
            const MenuBarView(),
            const RecentTransactionsFullView(),
          ],
        ),
      ),
    );
  }
}

// Recent transactions scrollable list
class RecentTransactionsFullView extends StatelessWidget {
  const RecentTransactionsFullView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: List<Widget>.generate(
          5,
          (i) => ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                'RECENT TRANSACTIONS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                separatorBuilder: (ctx, index) => const SizedBox(
                  height: 20,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return RecentTransactionWidget(
                      recentTransactionModel: recentTransactionList[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Menu bar scrollable list
class MenuBarView extends StatelessWidget {
  const MenuBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: grey4,
      labelColor: Colors.black,
      indicatorColor: grey5,
      indicatorWeight: 4,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      tabs: menuTitles.map((menuTitle) => Text(menuTitle)).toList(),
    );
  }
}

// Swipe to view card
class CardView extends StatelessWidget {
  const CardView({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
          padEnds: false,
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          itemBuilder: (ctx, index) {
            return SavedCardWidget(card: cards[index]);
          }),
    );
  }
}
