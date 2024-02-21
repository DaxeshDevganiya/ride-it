import 'dart:convert';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:rideit/main.dart';
import 'package:http/http.dart' as http;
import 'package:rideit/pages/Account.dart';
import 'package:rideit/pages/HomePage.dart';
import 'package:rideit/pages/Message.dart';
import 'package:rideit/pages/Post.dart';
import 'package:rideit/pages/Ride_Search.dart';

import 'package:rideit/pages/Signup.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 2;
  final screens = [
    HomePage(),
    Search(),
    Post(),
    Message(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    const Color color = Color.fromRGBO(25, 41, 49, 100);
    return Scaffold(
        backgroundColor: Color.fromRGBO(25, 41, 49, 100),
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          height: 60,
          index: index,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 600),
          items: [
            CurvedNavigationBarItem(
              child: Icon(Icons.home),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.search, size: 30),
              label: 'Search',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.add, size: 30),
              label: 'Post',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.message, size: 30),
              label: 'Message',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.account_circle, size: 30),
              label: 'Account',
            ),
          ],
          onTap: (index) => setState(() => this.index = index),
        ));
  }
}
