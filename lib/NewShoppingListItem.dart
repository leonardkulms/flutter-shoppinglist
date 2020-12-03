import 'ShoppingListForm.dart';
import 'package:flutter/material.dart';

typedef InputCallback = void Function(String text);

class NewShoppingListItem extends StatefulWidget {
  const NewShoppingListItem({this.action});
  final InputCallback action;

  @override
  _NewShoppingListItemState createState() => _NewShoppingListItemState();
}

class _NewShoppingListItemState extends State<NewShoppingListItem> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShoppingListForm(
      title: 'New Shopping Item',
      controller: controller,
      labelText: 'Product Name',
      action: widget.action,
    );
  }
}
