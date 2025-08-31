import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/categories_section.dart';
import '../widgets/products_section.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 140, // Height for AppBar + SearchBar
                floating: false,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      // Custom App Bar
                      const Expanded(
                        child: CustomAppBar(),
                      ),
                      
                      // Search Bar
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: CustomSearchBar(),
                      ),
                    ],
                  ),
                ),
                collapsedHeight: 60, // Height when collapsed
                toolbarHeight: 60,
                title: innerBoxIsScrolled 
                  ? const Text(
                      'Shoppe',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  : null,
                leading: innerBoxIsScrolled 
                  ? Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/profile.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,
                              child: const Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 16,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : null,
                actions: innerBoxIsScrolled 
                  ? [
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5CF6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ]
                  : null,
              ),
            ];
          },
          body: FadeTransition(
            opacity: _fadeAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  
                  // Categories Section
                  const CategoriesSection(),
                  
                  const SizedBox(height: 32),
                  
                  // Top Selling Section
                  const ProductsSection(
                    title: 'Топ продаж',
                    products: [
                      {
                        'id': '1',
                        'name': "Куртка Харрингтон",
                        'price': 148.00,
                        'imageUrl': 'assets/img/top_selling/top 1.png',
                        'category': 'Куртки',
                      },
                      {
                        'id': '2',
                        'name': 'Спортивная куртка ',
                        'price': 90.00,
                        // 'originalPrice': 100.97,
                        'imageUrl': 'assets/img/top_selling/top 2.png',
                        'category': 'Обувь',
                      },
                      {
                        'id': '3',
                        'name': 'шлепанцы Max Cirro',
                        'price': 50.00,
                        'imageUrl': 'assets/img/top_selling/top 3.png',
                        'category': 'Шорты',
                      },
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // New In Section
                  const ProductsSection(
                    title: 'Новинки',
                    products: [
                      {
                        'id': '4',
                        'name': 'Nike Air Max 270',
                        'price': 150.00,
                        'imageUrl': 'assets/img/new_in/ni 1.png',
                        'category': 'Обувь',
                      },
                      {
                        'id': '5',
                        'name': 'Adidas Originals Худи',
                        'price': 89.99,
                        'imageUrl': 'assets/img/new_in/ni 2.png',
                        'category': 'Худи',
                      },
                      {
                        'id': '6',
                        'name': 'Nike Dri-FIT Футболка',
                        'price': 35.00,
                        'imageUrl': 'assets/img/new_in/ni 3.png',
                        'category': 'Футболки',
                      },
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
