import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getTopSellingProducts();
  Future<List<ProductModel>> getNewInProducts();
  Future<ProductModel?> getProductById(String id);
  Future<void> toggleFavorite(String productId);
  Future<List<ProductModel>> getFavoriteProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  @override
  Future<List<ProductModel>> getTopSellingProducts() async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      const ProductModel(
        id: '1',
        name: "Куртка Харрингтон",
        price: 148.00,
        imageUrl: 'assets/img/top_selling/top 1.png',
        category: 'Куртки',
      ),
      const ProductModel(
        id: '2',
        name: 'Спортивная куртка ',
        price: 90.00,
        imageUrl: 'assets/img/top_selling/top 2.png',
        category: 'Обувь',
      ),
      const ProductModel(
        id: '3',
        name: 'шлепанцы Max Cirro',
        price: 50.00,
        imageUrl: 'assets/img/top_selling/top 3.png',
        category: 'Шорты',
      ),
    ];
  }

  @override
  Future<List<ProductModel>> getNewInProducts() async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      const ProductModel(
        id: '4',
        name: 'Nike Air Max 270',
        price: 150.00,
        imageUrl: 'assets/img/new_in/ni 1.png',
        category: 'Обувь',
      ),
      const ProductModel(
        id: '5',
        name: 'Adidas Originals Худи',
        price: 89.99,
        imageUrl: 'assets/img/new_in/ni 2.png',
        category: 'Худи',
      ),
      const ProductModel(
        id: '6',
        name: 'Nike Dri-FIT Футболка',
        price: 35.00,
        imageUrl: 'assets/img/new_in/ni 3.png',
        category: 'Футболки',
      ),
    ];
  }

  @override
  Future<ProductModel?> getProductById(String id) async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Здесь можно добавить логику получения продукта по ID
    // Пока возвращаем заглушку
    return const ProductModel(
      id: '1',
      name: "Куртка Харрингтон",
      price: 148.00,
      originalPrice: 180.00,
      imageUrl: 'assets/img/details/d1.png',
      category: 'Куртки',
    );
  }

  @override
  Future<void> toggleFavorite(String productId) async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 200));
    
    // Здесь будет логика переключения избранного
    // Пока просто заглушка
  }

  @override
  Future<List<ProductModel>> getFavoriteProducts() async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 400));
    
    // Возвращаем пустой список избранных продуктов
    return [];
  }
}
