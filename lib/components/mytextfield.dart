import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscuredText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscuredText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscuredText,
        decoration: InputDecoration(
          
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          //hintMaxLines: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
