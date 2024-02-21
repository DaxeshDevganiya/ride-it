import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rideit/main.dart';
import 'package:http/http.dart' as http;
import 'package:rideit/pages/Dashboard.dart';
import 'package:rideit/pages/Signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final apiUrl = "http://192.168.0.81:3000/login";
  final _formfield = GlobalKey<FormState>();
  final fistnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final UserTypeController = TextEditingController();
  String userType = "";
  void changeUserType(String? value) {
    setState(() {
      userType = value!;
    });
  }

  Future<void> login() async {
    var response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var role = responseData['Data']['role'];
      if (role == "driver") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashBoard()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Signup()),
        );
      }
    } else {
      var responseData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(responseData['message']),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0x00192931),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Form(
                key: _formfield,
                child: Column(
                  children: [
                    SizedBox(height: 100.00),
                    Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20.00),
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.00)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelStyle: new TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email";
                        }
                      },
                    ),
                    SizedBox(height: 20.00),
                    TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.00)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelStyle: new TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        }
                      },
                    ),
                    SizedBox(height: 20.00),
                    SizedBox(height: 20.00),
                    // Container(
                    //   height: screenHeight * 0.06,
                    //   width: screenWidth * 0.4,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     color: Colors.white,
                    //   ),
                    //   child: Center(
                    //     // child: InkWell(
                    //     //   onTap: () {
                    //     //     if (_formfield.currentState!.validate()) {
                    //     //       login();
                    //     //     }
                    //     //   },
                    //     //   child: Text("Login ",
                    //     //       style: TextStyle(
                    //     //           color: Colors.black,
                    //     //           fontSize: 20.0,
                    //     //           fontWeight: FontWeight.bold)),
                    //     // ),

                    //   ),
                    // ),
                    SizedBox(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.4,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: 14, color: Colors.black))),
                          onPressed: () {
                            if (_formfield.currentState!.validate()) {
                              login();
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ),
                    SizedBox(height: 20.00),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text("Don't have account ? click here",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.00,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ))),
    );
  }
}
