import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;
  AppTextField({Key? key,

    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscure=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(left: 24, right: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: isObscure? true : false,
        controller: textController,
        decoration: InputDecoration(
            //hintText,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15),
            // prefixIcon
            prefixIcon: Icon(icon,
                color:Colors.grey,
              size: 17,
            ),
            //focusedBorder
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            //enabled Border
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            // enabledBorder
            //
            // border
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),

            )
        ),
      ),
    );
  }
}