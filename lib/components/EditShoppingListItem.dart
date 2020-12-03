import 'ShoppingListForm.dart';
import 'package:flutter/material.dart';

typedef InputCallback = void Function(String text);

class EditShoppingListItem extends StatefulWidget {
  const EditShoppingListItem({this.action, this.oldName});

  final InputCallback action;
  final String oldName;

  @override
  _EditShoppingListItemState createState() => _EditShoppingListItemState();
}

class _EditShoppingListItemState extends State<EditShoppingListItem> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.oldName;
    return super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShoppingListForm(
      title: 'Edit Shopping Item',
      controller: controller,
      labelText: 'Product Name',
      action: widget.action,
    );
  }
}
