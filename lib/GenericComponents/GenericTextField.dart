import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  GenericTextField({this.controller, this.labelText});

  final TextEditingController controller;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          maxLines: 1,
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ));
  }
}
