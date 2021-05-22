// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_database_example/features/authentication/login/views/login.dart';
import 'package:sqflite_database_example/features/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double width;
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 10),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF0A043C),
      body: Stack(
        children: [
          icon(),
          loader(),
        ],
      ),
    );
  }

  icon() {
    return Center(
      child: Container(
        width: Get.width / 1.5,
        height: 100.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/logo.png'), fit: BoxFit.contain),
        ),
      ),
    );
  }

  loader() {
    return Positioned(
      bottom: 40.0,
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: SizedBox(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            strokeWidth: 2.0,
          ),
          height: 50.0,
          width: 50.0,
        ),
      ),
    );
  }
}
