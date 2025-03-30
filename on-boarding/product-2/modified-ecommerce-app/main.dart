void main() {
  final products = <Product>[];
  
  final viewAllProducts = ViewAllProductsUsecase(products);
  final viewProduct = ViewProductUsecase(products);
  final createProduct = CreateProductUsecase(products);
  final updateProduct = UpdateProductUsecase(products);
  final deleteProduct = DeleteProductUsecase(products);

  while (true) {
    print('\n=== eCommerce Product Management ===');
    print('1. View All Products');
    print('2. View Product Details');
    print('3. Add New Product');
    print('4. Update Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Enter your choice: ');

    final choice = stdin.readLineSync()?.trim();

    switch (choice) {
      case '1':
        final allProducts = viewAllProducts(null);
        if (allProducts.isEmpty) {
          print('No products available.');
        } else {
          print('\nAll Products:');
          allProducts.forEach(print);
        }
        break;

      case '2':
        stdout.write('Enter product ID: ');
        final id = stdin.readLineSync()?.trim() ?? '';
        final product = viewProduct(id);
        print(product ?? 'Product not found.');
        break;

      case '3':
        try {
          stdout.write('Enter product ID: ');
          final id = stdin.readLineSync()?.trim() ?? '';
          stdout.write('Enter product name: ');
          final name = stdin.readLineSync()?.trim() ?? '';
          stdout.write('Enter product description: ');
          final description = stdin.readLineSync()?.trim() ?? '';
          stdout.write('Enter product image URL: ');
          final imageUrl = stdin.readLineSync()?.trim() ?? '';
          stdout.write('Enter product price: ');
          final price = double.parse(stdin.readLineSync()?.trim() ?? '0');

          createProduct(Product(
            id: id,
            name: name,
            description: description,
            imageUrl: imageUrl,
            price: price,
          ));
          print('Product added successfully!');
        } catch (e) {
          print('Error: Invalid input. Please try again.');
        }
        break;

      case '4':
        stdout.write('Enter product ID to update: ');
        final id = stdin.readLineSync()?.trim() ?? '';
        final existing = viewProduct(id);

        if (existing == null) {
          print('Product not found.');
          break;
        }

        try {
          stdout.write('Enter new name [${existing.name}]: ');
          final name = stdin.readLineSync()?.trim();
          stdout.write('Enter new description [${existing.description}]: ');
          final description = stdin.readLineSync()?.trim();
          stdout.write('Enter new image URL [${existing.imageUrl}]: ');
          final imageUrl = stdin.readLineSync()?.trim();
          stdout.write('Enter new price [${existing.price}]: ');
          final priceInput = stdin.readLineSync()?.trim();

          updateProduct(Product(
            id: id,
            name: name?.isNotEmpty == true ? name : existing.name,
            description: description?.isNotEmpty == true ? description : existing.description,
            imageUrl: imageUrl?.isNotEmpty == true ? imageUrl : existing.imageUrl,
            price: priceInput?.isNotEmpty == true ? double.parse(priceInput!) : existing.price,
          ));
          print('Product updated successfully!');
        } catch (e) {
          print('Error: Invalid input. Please try again.');
        }
        break;

      case '5':
        stdout.write('Enter product ID to delete: ');
        final id = stdin.readLineSync()?.trim() ?? '';
        final product = viewProduct(id);

        if (product == null) {
          print('Product not found.');
          break;
        }

        stdout.write('Confirm delete "${product.name}"? (y/n): ');
        final confirm = stdin.readLineSync()?.trim().toLowerCase();
        if (confirm == 'y') {
          deleteProduct(id);
          print('Product deleted successfully!');
        } else {
          print('Deletion cancelled.');
        }
        break;

      case '6':
        print('Exiting...');
        exit(0);

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
