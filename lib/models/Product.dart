class Product {
  Product({this.id, this.name});
  final int id;
  String name;

  void update(String newName) {
    this.name = newName;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Implement toString to make it easier to see information about
  // each produt when using the print statement.
  @override
  String toString() {
    return 'Product{id: $id, name: $name}';
  }
}
