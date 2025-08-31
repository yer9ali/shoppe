import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetTopSellingProducts {
  final ProductRepository repository;

  GetTopSellingProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getTopSellingProducts();
  }
}
