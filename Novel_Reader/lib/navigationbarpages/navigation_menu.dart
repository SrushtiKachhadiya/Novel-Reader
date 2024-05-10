import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:project_4/navigationbarpages/favorite_screen.dart';
import 'package:project_4/navigationbarpages/library_screen.dart';
import 'package:project_4/main.dart';
import 'package:project_4/navigationbarpages/profile_screen.dart';

class NavigationMenu extends StatefulWidget {
  @override
  State<NavigationMenu> createState() => _NavigationMenuState();

}

class _NavigationMenuState extends State<NavigationMenu> {
  int index = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          items: [
            CurvedNavigationBarItem(
                child: Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            )),
            CurvedNavigationBarItem(
                child: Icon(
              Icons.library_books,
              size: 30,
              color: Colors.white,
            )),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.favorite,
                size: 30,
                color: Colors.white,
              ),
            ),
            // CurvedNavigationBarItem(
            //     child: Icon(Icons.store, size: 30, color: Colors.white,)),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Theme.of(context).colorScheme.primary,
          color: Theme.of(context).colorScheme.primary,
          iconPadding: 10,
          index: index,
          onTap: (selectedIndex) {
            // if (index == 0) {
            //   DashBoardScreen();
            // } else if (index == 1) {
            //    LibraryScreen();
            // } else if (index == 2) {
            //    FavoriteScreen();
            // } else {
            //   ProfileScreen(widget.email);
           // }
            setState(
              () {

                index = selectedIndex;
              },
            );
          },
          letIndexChange: (index) => true,
        ),
       body:getSelectedWidget(index: index)
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    if (index == 0) {
      widget = DashBoardScreen();
    } else if (index == 1) {
      widget = LibraryScreen();
    } else if (index == 2) {
      widget = FavoriteScreen();
    } else {
      widget = ProfileScreen();
    }
    return widget;
  }
 }
