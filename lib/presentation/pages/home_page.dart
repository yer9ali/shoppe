import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/categories_section.dart';
import '../widgets/products_section.dart';
import '../widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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

    // Load data when page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().loadData();
    });
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
          body: Consumer<HomeProvider>(
            builder: (context, homeProvider, child) {
              if (homeProvider.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF8B5CF6),
                  ),
                );
              }

              if (homeProvider.error != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ошибка: ${homeProvider.error}',
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => homeProvider.refresh(),
                        child: const Text('Повторить'),
                      ),
                    ],
                  ),
                );
              }

              return FadeTransition(
                opacity: _fadeAnimation,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      CategoriesSection(categories: homeProvider.categories),
                      const SizedBox(height: 32),
                      ProductsSection(
                        title: 'Топ продаж',
                        products: homeProvider.topSellingProducts,
                      ),
                      const SizedBox(height: 32),
                      ProductsSection(
                        title: 'Новинки',
                        products: homeProvider.newInProducts,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
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
