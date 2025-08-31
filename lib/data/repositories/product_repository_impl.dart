import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<Product>> getTopSellingProducts() async {
    try {
      final productModels = await localDataSource.getTopSellingProducts();
      return productModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get top selling products: $e');
    }
  }

  @override
  Future<List<Product>> getNewInProducts() async {
    try {
      final productModels = await localDataSource.getNewInProducts();
      return productModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get new in products: $e');
    }
  }

  @override
  Future<Product> getProductById(String id) async {
    try {
      final productModel = await localDataSource.getProductById(id);
      if (productModel == null) {
        throw Exception('Product not found');
      }
      return productModel.toEntity();
    } catch (e) {
      throw Exception('Failed to get product by id: $e');
    }
  }

  @override
  Future<void> toggleFavorite(String productId) async {
    try {
      await localDataSource.toggleFavorite(productId);
    } catch (e) {
      throw Exception('Failed to toggle favorite: $e');
    }
  }

  @override
  Future<List<Product>> getFavoriteProducts() async {
    try {
      final productModels = await localDataSource.getFavoriteProducts();
      return productModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get favorite products: $e');
    }
  }
}
