import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_new_in_products.dart';
import '../../domain/usecases/get_top_selling_products.dart';
import '../data/datasources/category_local_datasource.dart';
import '../data/datasources/product_local_datasource.dart';
import '../data/repositories/category_repository_impl.dart';
import '../data/repositories/product_repository_impl.dart';

class InjectionContainer {
  static final InjectionContainer _instance = InjectionContainer._internal();
  factory InjectionContainer() => _instance;
  InjectionContainer._internal();

  // Data Sources
  late final ProductLocalDataSource _productLocalDataSource = ProductLocalDataSourceImpl();
  late final CategoryLocalDataSource _categoryLocalDataSource = CategoryLocalDataSourceImpl();

  // Repositories
  late final ProductRepository _productRepository = ProductRepositoryImpl(_productLocalDataSource);
  late final CategoryRepository _categoryRepository = CategoryRepositoryImpl(_categoryLocalDataSource);

  // Use Cases
  late final GetTopSellingProducts _getTopSellingProducts = GetTopSellingProducts(_productRepository);
  late final GetNewInProducts _getNewInProducts = GetNewInProducts(_productRepository);
  late final GetCategories _getCategories = GetCategories(_categoryRepository);

  // Getters
  ProductRepository get productRepository => _productRepository;
  CategoryRepository get categoryRepository => _categoryRepository;
  GetTopSellingProducts get getTopSellingProducts => _getTopSellingProducts;
  GetNewInProducts get getNewInProducts => _getNewInProducts;
  GetCategories get getCategories => _getCategories;
}

// Global instance
final getIt = InjectionContainer();
