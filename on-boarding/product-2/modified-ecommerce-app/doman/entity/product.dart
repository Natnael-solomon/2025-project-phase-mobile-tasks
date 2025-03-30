class Product {
  final String id;
  String name;
  String description;
  double price;
  String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  String toString() {
    return '''
ID: $id
Name: $name
Description: $description
Price: \$${price.toStringAsFixed(2)}
Image URL: $imageUrl
----------------------------''';
  }
}
