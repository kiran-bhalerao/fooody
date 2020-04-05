import 'package:flutter/material.dart';
import 'package:fooody/custom_color_scheme.dart';
import 'package:fooody/screens/tabs/HomeTab.dart';
import 'package:fooody/screens/tabs/OrdersTab.dart';
import 'package:fooody/screens/tabs/ProfileTab.dart';
import 'package:fooody/screens/tabs/SearchTab.dart';
import 'package:fooody/widgets/CircleTabIndicator.dart';
import 'package:fooody/widgets/CustomTab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _tabIndex = 0;

  List<Widget> homeTabs = [HomeTab(), SearchTab(), OrderTab(), ProfileTab()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  void onTabSelect(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  Color getActiveTabColor(int index, BuildContext context) {
    switch (index) {
      case 0:
        return CustomColorScheme(Theme.of(context).colorScheme).ternary;
      case 1:
        return CustomColorScheme(Theme.of(context).colorScheme).secondary;
      case 2:
        return CustomColorScheme(Theme.of(context).colorScheme).dark;
      case 3:
        return CustomColorScheme(Theme.of(context).colorScheme).primary;
      default:
        return CustomColorScheme(Theme.of(context).colorScheme).ternary;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: getActiveTabColor(_tabIndex, context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height - 88,
              child: homeTabs[_tabIndex],
            ),
            Container(
              color: CustomColorScheme(Theme.of(context).colorScheme).light,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: TabBar(
                  controller: _tabController,
                  onTap: onTabSelect,
                  indicatorColor: Color(0xFF469469),
                  labelColor:
                      CustomColorScheme(Theme.of(context).colorScheme).primary,
                  indicator: CircleTabIndicator(
                      color: CustomColorScheme(Theme.of(context).colorScheme)
                          .primary,
                      radius: 2.8),
                  unselectedLabelColor: Colors.grey.withOpacity(0.6),
                  isScrollable: true,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  tabs: <Widget>[
                    CustomTab(
                      activeIndex: _tabIndex,
                      index: 0,
                      text: 'Home',
                      icon: Icons.home,
                    ),
                    CustomTab(
                      activeIndex: _tabIndex,
                      index: 1,
                      text: 'Search',
                      icon: Icons.search,
                    ),
                    CustomTab(
                      activeIndex: _tabIndex,
                      index: 2,
                      text: 'Orders',
                      icon: Icons.event_note,
                    ),
                    CustomTab(
                      activeIndex: _tabIndex,
                      index: 3,
                      text: 'Profile',
                      icon: Icons.person,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
