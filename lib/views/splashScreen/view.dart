import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/views/home_page/view.dart';
import 'package:untitled/views/login_screen/view.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final idToken = prefs.getString('idToken');
    if (idToken == null)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => LoginView()));
    else
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => HomePage()));
  }

  @override
  void initState() {
    // Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>LoginView())));
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading..'),
      ),
    );
  }
}
