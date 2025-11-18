import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/home/widgets/card_item.dart';
import 'package:hungry/features/home/widgets/category_field.dart';
import 'package:hungry/features/home/widgets/search_bar.dart';
import 'package:hungry/features/home/widgets/user_header.dart';
import 'package:hungry/shared/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  List<String> category = [
    'All',
    'Combo',
    'Sliders',
    'Classic'
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            /// Pinned header and search
            SliverPersistentHeader(
              pinned: true,
              delegate: _HeaderDelegate(
                minHeight: 232,
                maxHeight: 232,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UserHeader(),
                        Gap(10),
                        CustomSearchBar(),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// category
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Gap(25),
                    CategoryField(
                      category: category,
                      selectedIndex: selectedIndex,
                      onCategorySelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// GridView
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return CardItem(
                      image: 'assets/card/1.png',
                      text: 'Cheeseburger',
                      desc: 'Wendys Burger',
                      rate: '4.9',
                    );
                  },
                  childCount: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom SliverPersistentHeaderDelegate for pinned header
class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _HeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}