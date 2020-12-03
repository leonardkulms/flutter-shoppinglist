import 'package:flutter/material.dart';
import 'package:shoppinglist/GenericDialog.dart';
import 'EditShoppingListItem.dart';

class Product {
  Product({this.name});
  String name;

  void update(String newName) {
    this.name = newName;
  }
}

typedef void CartChangedCallback(Product product, bool inCart);
typedef void RemoveCallback(String name);

class ShoppingListItem extends StatefulWidget {
  ShoppingListItem(
      {this.product, this.inCart, this.onCartChanged, this.removeProduct})
      : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;
  final RemoveCallback removeProduct;
  @override
  _ShoppingListItemState createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  void _updateProduct(newName) {
    setState(() {
      widget.product.update(newName);
    });
  }

  _displayDialog(context) {
    Widget widg = EditShoppingListItem(action: _updateProduct);
    displayDialog(context, widg);
  }

  Color _getColor(BuildContext context) {
    return widget.inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle getTextStyle(BuildContext context) {
    if (!widget.inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          widget.onCartChanged(widget.product, widget.inCart);
        },
        onLongPress: () {
          _displayDialog(context);
        },
        leading: CircleAvatar(
          backgroundColor: _getColor(context),
          child: Text(widget.product.name[0]),
        ),
        trailing: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: IconButton(
              onPressed: () {
                widget.removeProduct(widget.product.name);
              },
              icon: Icon(Icons.delete),
              color: Colors.white,
            )),
        title: Text(widget.product.name, style: getTextStyle(context)));
  }
}
