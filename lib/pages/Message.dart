import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rideit/main.dart';
import 'package:http/http.dart' as http;
import 'package:rideit/pages/Dashboard.dart';
import 'package:rideit/pages/Signup.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 41, 49, 100),
      body: Center(
        child: Text(
          "Message",
          style: TextStyle(
              color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
