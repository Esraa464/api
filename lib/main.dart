import 'package:flutter/material.dart';
import 'package:untitled/views/home_page/view.dart';
import 'package:untitled/views/splashScreen/view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
