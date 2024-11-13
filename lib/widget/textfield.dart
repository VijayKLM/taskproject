import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final TextEditingController controller ;
  final String hintText;
  const Textfield({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: hintText,
                ),
                
              )
            );
  }
}