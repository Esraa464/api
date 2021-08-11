import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget boldText (text){
  return  Text(text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ));
}