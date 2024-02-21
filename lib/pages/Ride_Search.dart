import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rideit/main.dart';
import 'package:http/http.dart' as http;
import 'package:rideit/pages/Dashboard.dart';
import 'package:rideit/pages/Signup.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 41, 49, 100),
      body: Center(
        child: Text(
          "Search",
          style: TextStyle(
              color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
