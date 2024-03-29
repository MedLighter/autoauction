import 'dart:io';

import 'package:autoauction/pages/car_search.dart';
import 'package:autoauction/pages/favorite.dart';
import 'package:autoauction/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<StatefulWidget> createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen> {
  static const int initPageIndex = 1;
  int currentPageIndex = initPageIndex;
  final PageController _pageController =
      PageController(initialPage: initPageIndex, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: const [FavoriteScreen(), CarSearchScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: Platform.isAndroid ? 16 : 0,
        ),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.grey[200]),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Избранное',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.car_detailed),
                  label: 'Главная',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_solid),
                  label: 'Профиль',
                ),
              ],
              currentIndex: currentPageIndex,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              type: BottomNavigationBarType.shifting,
              unselectedItemColor: Colors.black26,
              onTap: (int index) {
                setState(() {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
