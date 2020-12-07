import 'package:flutter/material.dart';

import '../GenericComponents/GenericTextField.dart';
import '../GenericComponents/GenericButtons.dart';

typedef InputCallback = void Function(String text);

class ShoppingListForm extends StatelessWidget {
  ShoppingListForm({
    this.title,
    this.controller,
    this.labelText,
    this.action,
  });
  final String title;
  final TextEditingController controller;
  final String labelText;
  final InputCallback action;
  final _formKey = GlobalKey<FormState>();

  Widget userInput() => GenericTextField(
        controller: controller,
        labelText: labelText,
        action: action,
        formKey: _formKey,
      );

  Widget buttons() => GenericButtons(
        action: action,
        controller: controller,
        formKey: _formKey,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            userInput(),
            buttons(),
          ],
        ),
      ),
    );
  }
}
