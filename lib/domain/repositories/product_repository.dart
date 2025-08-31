import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getTopSellingProducts();
  Future<List<Product>> getNewInProducts();
  Future<Product> getProductById(String id);
  Future<void> toggleFavorite(String productId);
  Future<List<Product>> getFavoriteProducts();
}
