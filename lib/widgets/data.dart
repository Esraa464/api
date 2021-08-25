import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  String name;
  String birthDAy;
  String nickname;
  String portrayed;
  String status;

  Data({this.name, this.birthDAy, this.nickname, this.portrayed, this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$name'),
              Text('$birthDAy'),
              Text('$nickname'),
              Text('$portrayed'),
              Text('$status'),
            ],
          ),
        ));
  }
}
