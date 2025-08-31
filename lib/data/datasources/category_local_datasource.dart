import '../models/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel?> getCategoryById(String id);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 300));
    
    return [
      const CategoryModel(
        id: '1',
        name: 'Худи',
        imageUrl: 'assets/img/hoodies.png',
      ),
      const CategoryModel(
        id: '2',
        name: 'Шорты',
        imageUrl: 'assets/img/shorts.png',
      ),
      const CategoryModel(
        id: '3',
        name: 'Обувь',
        imageUrl: 'assets/img/shoes.png',
      ),
      const CategoryModel(
        id: '4',
        name: 'Сумки',
        imageUrl: 'assets/img/bag.png',
      ),
      const CategoryModel(
        id: '5',
        name: 'Аксессуары',
        imageUrl: 'assets/img/accessories.png',
      ),
    ];
  }

  @override
  Future<CategoryModel?> getCategoryById(String id) async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 200));
    
    final categories = await getCategories();
    try {
      return categories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }
}
