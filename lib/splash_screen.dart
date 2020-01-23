import 'dart:async';

import 'package:flutter/material.dart';

import './screen/home_page.dart';



class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() { 
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>  HomePage(), 
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.withOpacity(0.6),
                Colors.pink,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
            ),
          ),
          child: Center(
            child: Text(
              'Multiple Quiz ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
  
    );
  }
}