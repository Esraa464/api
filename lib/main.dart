import 'package:flutter/material.dart';
import 'package:untitled/screens/splashScreen/view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
