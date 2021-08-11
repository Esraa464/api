import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBar (text){
  return  AppBar(
    //  automaticallyImplyLeading: false,
    leading: Icon(
      Icons.arrow_back,
      color: Colors.black,
    ),
    title: Padding(
      padding: const EdgeInsets.only(right: 36),
      child: Text(
        text,
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}