import 'package:flutter/material.dart';
import 'package:untitled/const/colors.dart';
Widget mainButton({text,press}) {
  return
    Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child:
        InkWell(
            onTap: press,
            child:
            Container(
              child:Center(child: Text(text,style: TextStyle(color: Colors.white),)) ,
              height: 50,
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(10)),

            ))
    );
}
