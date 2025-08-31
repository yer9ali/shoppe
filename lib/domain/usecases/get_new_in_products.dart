import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetNewInProducts {
  final ProductRepository repository;

  GetNewInProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getNewInProducts();
  }
}
