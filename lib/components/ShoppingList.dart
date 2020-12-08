import 'package:flutter/material.dart';
import 'ShoppingListItem.dart';
import 'NewShoppingListItem.dart';
import '../GenericComponents/GenericDialog.dart';
import '../models/Product.dart';
import 'package:shoppinglist/contexts/products.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  void initState() {
    super.initState();
    produs = _initProducts();
  }

  Future<List<Product>> produs;

  Future<List<Product>> _initProducts() async {
    return await products();
  }

  void _addProduct(String userInput) {
    setState(() {
      insertProduct(Product(name: userInput));
    });
  }

  void _removeProduct(int id) {
    setState(() {
      deleteProduct(id);
    });
  }

  _displayDialog() {
    Widget widget = NewShoppingListItem(action: _addProduct);
    displayDialog(context, widget);
  }

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
      body: FutureBuilder(
        future: produs,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return ShoppingListItem(
                    product: snapshot.data[index],
                    inCart: _shoppingCart.contains(snapshot.data[index]),
                    onCartChanged: _handleCartChanged,
                    removeProduct: _removeProduct,
                  );
                },
              ),
            );
          }
        },
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
