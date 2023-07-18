import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                'assets/images/arrow_right.svg',
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
            'assets/images/menu.svg',
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
            SizedBox(
              height: 180,
              child: PageView.builder(
                  padEnds: false,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemBuilder: (_, index) {
                    return SavedCardWidget(index: index);
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            PageIndicator(
              totalPage: 2,
              pageController: _pageController,
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              isScrollable: true,
              unselectedLabelColor: grey4,
              labelColor: Colors.black,
              indicatorColor: grey5,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              tabs: List<Widget>.generate(
                5,
                (int index) => Text(
                  'Menu title $index',
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: List<Widget>.generate(
                  5,
                  (int i) => ListView(
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
                        separatorBuilder: (_, j) => const SizedBox(
                          height: 20,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return RecentTransactionWidget(index: index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
