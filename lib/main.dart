import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ue_mock/src/screens/home.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final tabsProvider = StateProvider((_) => 0);
final navigationProvider = StateProvider((_) => 0);

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: 0);
    final navIndex = useProvider(navigationProvider);

    final List<Widget> tabPages = [
      Home(),
      Center(child: Text('Search')),
      Center(child: Text('Grocery')),
      Center(child: Text('Orders')),
      Center(child: Text('Account')),
    ];

    _buildBottomNavigationBar() {
      return BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: navIndex.state,
        onTap: (int val) {
          context.read(navigationProvider).state = val;
          pageController.jumpToPage(val);
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartBar),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.penSquare),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.truck),
            label: 'Grocery',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.moneyBillAlt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: PageView(
          children: tabPages,
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}
