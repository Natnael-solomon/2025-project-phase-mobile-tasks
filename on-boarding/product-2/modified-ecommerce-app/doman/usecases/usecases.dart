abstract class UseCase<Type, Params> {
  Type call(Params params);
}

class ViewAllProductsUsecase implements UseCase<List<Product>, void> {
  final List<Product> products;

  ViewAllProductsUsecase(this.products);

  @override
  List<Product> call(void params) => products;
}

class ViewProductUsecase implements UseCase<Product?, String> {
  final List<Product> products;

  ViewProductUsecase(this.products);

  @override
  Product? call(String id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}

class CreateProductUsecase implements UseCase<void, Product> {
  final List<Product> products;

  CreateProductUsecase(this.products);

  @override
  void call(Product product) {
    products.add(product);
  }
}

class UpdateProductUsecase implements UseCase<void, Product> {
  final List<Product> products;

  UpdateProductUsecase(this.products);

  @override
  void call(Product product) {
    final index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index] = product;
    }
  }
}

class DeleteProductUsecase implements UseCase<void, String> {
  final List<Product> products;

  DeleteProductUsecase(this.products);

  @override
  void call(String id) {
    products.removeWhere((product) => product.id == id);
  }
}
