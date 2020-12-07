import 'package:flutter/material.dart';

typedef InputCallback = void Function(String text);

class GenericButtons extends StatelessWidget {
  GenericButtons({
    this.action,
    this.controller,
    this.formKey,
  });

  final TextEditingController controller;
  final InputCallback action;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 8),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            color: Colors.white,
            child: Text(
              "Save".toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              if (formKey.currentState.validate()) {
                action(controller.text);
                return Navigator.of(context).pop(true);
              }
            },
          )
        ],
      ),
    );
  }
}
