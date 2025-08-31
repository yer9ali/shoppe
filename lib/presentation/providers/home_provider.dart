import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_new_in_products.dart';
import '../../domain/usecases/get_top_selling_products.dart';

class HomeProvider extends ChangeNotifier {
  final GetTopSellingProducts _getTopSellingProducts;
  final GetNewInProducts _getNewInProducts;
  final GetCategories _getCategories;

  HomeProvider({
    required GetTopSellingProducts getTopSellingProducts,
    required GetNewInProducts getNewInProducts,
    required GetCategories getCategories,
  })  : _getTopSellingProducts = getTopSellingProducts,
        _getNewInProducts = getNewInProducts,
        _getCategories = getCategories;

  // State
  List<Product> _topSellingProducts = [];
  List<Product> _newInProducts = [];
  List<Category> _categories = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Product> get topSellingProducts => _topSellingProducts;
  List<Product> get newInProducts => _newInProducts;
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Methods
  Future<void> loadData() async {
    _setLoading(true);
    _clearError();

    try {
      await Future.wait([
        _loadTopSellingProducts(),
        _loadNewInProducts(),
        _loadCategories(),
      ]);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _loadTopSellingProducts() async {
    try {
      _topSellingProducts = await _getTopSellingProducts();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load top selling products: $e');
    }
  }

  Future<void> _loadNewInProducts() async {
    try {
      _newInProducts = await _getNewInProducts();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load new in products: $e');
    }
  }

  Future<void> _loadCategories() async {
    try {
      _categories = await _getCategories();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load categories: $e');
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }

  void refresh() {
    loadData();
  }
}
