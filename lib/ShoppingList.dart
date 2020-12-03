import 'package:flutter/material.dart';
import 'ShoppingListItem.dart';
import 'NewShoppingListItem.dart';
import 'GenericDialog.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  void _addProduct(String userInput) {
    setState(() {
      products.add(Product(name: userInput));
    });
  }

  _displayDialog() {
    Widget widget = NewShoppingListItem(action: _addProduct);
    displayDialog(context, widget);
  }

  List<Product> products = <Product>[
    Product(name: 'Eggs'),
    Product(name: 'Toast'),
    Product(name: 'dark chocolate'),
  ];

  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
