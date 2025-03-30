
import 'dart:io';

class Product {
  String _name;
  String _description;
  double _price;


  Product(this._name, this._description, this._price);

  String get name => _name;
  String get description => _description;
  double get price => _price;

  set name(String name) => _name = name;
  set description(String description) => _description = description;
  set price(double price) => _price = price;

  @override
  String toString() {
    return 'Name: $_name, Description: $_description, Price: \$$_price';
  }
}

class ProductManager {
  final List<Product> _products = [];

  void addProduct(Product? product) {
    _products.add(product!);
    print('Product added: ${product.name}');
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print('No products available.');
    } else {
      print('All Products:');
      for (var product in _products) {
        print(product);
      }
    }
  }

  void viewProduct(String name) {
    var product = _products.firstWhere(
          (product) => product.name == name,
      orElse: () => null!,
    );

    if (product != null) {
      print('Product Details: $product');
    } else {
      print('Product not found.');
    }
  }

  void editProduct(String name, String newName, String newDescription, double newPrice) {
    var product = _products.firstWhere(
          (product) => product.name == name,
      orElse: () => null!,
    );

    if (product != null) {
      product.name = newName;
      product.description = newDescription;
      product.price = newPrice;
      print('Product updated: $product');
    } else {
      print('Product not found.');
    }
  }

  void deleteProduct(String name) {
    var product = _products.firstWhere(
          (product) => product.name == name,
      orElse: () => null!,
    );

    if (product != null) {
      _products.remove(product);
      print('Product deleted: $name');
    } else {
      print('Product not found.');
    }
  }
}

void main() {
  var productManager = ProductManager();
  while (true) {
    print('\n=== eCommerce Application ===');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Choose an option: ');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter product name: ');
        var name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        var description = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        var price = double.parse(stdin.readLineSync()!);

        productManager.addProduct(Product(name, description, price));
        break;

      case '2':
        productManager.viewAllProducts();
        break;

      case '3':
        stdout.write('Enter product name: ');
        var name = stdin.readLineSync()!;
        productManager.viewProduct(name);
        break;

      case '4':
        stdout.write('Enter product name to edit: ');
        var name = stdin.readLineSync()!;
        stdout.write('Enter new product name: ');
        var newName = stdin.readLineSync()!;
        stdout.write('Enter new product description: ');
        var newDescription = stdin.readLineSync()!;
        stdout.write('Enter new product price: ');
        var newPrice = double.parse(stdin.readLineSync()!);

        productManager.editProduct(name, newName, newDescription, newPrice);
        break;

      case '5':
        stdout.write('Enter product name to delete: ');
        var name = stdin.readLineSync()!;
        productManager.deleteProduct(name);
        break;

      case '6':
        print('Exiting application...');
        return;

      default:
        print('Invalid choice. Try again.');
    }
  }
}

