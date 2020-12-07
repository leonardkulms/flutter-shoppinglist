import 'package:flutter/material.dart';

typedef InputCallback = void Function(String name);

class GenericTextField extends StatelessWidget {
  GenericTextField(
      {this.controller, this.labelText, this.action, this.formKey});

  final TextEditingController controller;
  final String labelText;
  final InputCallback action;
  final GlobalKey<FormState> formKey;

  void _handleSubmitted(String value, context) {
    action(value);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'A Product name needs at least one character';
            }
            return null;
          },
          onFieldSubmitted: (value) {
            if (formKey.currentState.validate()) {
              _handleSubmitted(value, context);
            }
          },
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
