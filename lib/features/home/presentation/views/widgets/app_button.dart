import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key,
    required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        height: 40,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          color: Colors.blue,
          ),
        child:  Center(
          child: Text(
           text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}