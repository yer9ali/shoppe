import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_local_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource localDataSource;

  CategoryRepositoryImpl(this.localDataSource);

  @override
  Future<List<Category>> getCategories() async {
    try {
      final categoryModels = await localDataSource.getCategories();
      return categoryModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get categories: $e');
    }
  }

  @override
  Future<Category> getCategoryById(String id) async {
    try {
      final categoryModel = await localDataSource.getCategoryById(id);
      if (categoryModel == null) {
        throw Exception('Category not found');
      }
      return categoryModel.toEntity();
    } catch (e) {
      throw Exception('Failed to get category by id: $e');
    }
  }
}
