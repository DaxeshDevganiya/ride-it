import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rideit/main.dart';
import 'package:http/http.dart' as http;
import 'package:rideit/pages/Dashboard.dart';
import 'package:rideit/pages/Signup.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 41, 49, 100),
      body: Center(
          child: Text(
        "Account",
        style: TextStyle(
            color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
      )),
    );
  }
}
