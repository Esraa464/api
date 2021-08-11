import 'package:flutter/material.dart';

class DefaultTextFormField extends StatefulWidget {
  final validator;
  final controller;
  final type;
  final hintTxt;
  final isPassword;
  final isHidden;

  const DefaultTextFormField({
    this.controller,
    this.type = TextInputType.text,
    this.hintTxt,
    this.validator,
    this.isHidden = false,
    this.isPassword = false,
  });

  @override
  _DefaultTextFormFieldState createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  IconData suffix = Icons.visibility_off;
  bool isSuffix = true;
  bool visable = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
            obscureText: widget.isPassword ? visable : false,
            validator: widget.validator,
            cursorColor: Colors.deepOrange,
            cursorHeight: 30,
            controller: widget.controller,
            keyboardType: widget.type,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400])),
                hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                hintText: widget.hintTxt,
                suffixIcon: widget.isHidden
                    ? IconButton(
                    icon: Icon(suffix),
                    onPressed: () {
                      setState(() {
                        visable = !visable;
                        isSuffix = !isSuffix;
                        isSuffix
                            ? suffix = Icons.visibility
                            : suffix = Icons.visibility_off;
                      });
                    })
                    : null)));
  }
}
