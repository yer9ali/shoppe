import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'di/injection_container.dart';
import 'presentation/providers/home_provider.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const ShoppeApp());
}

class ShoppeApp extends StatelessWidget {
  const ShoppeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            getTopSellingProducts: getIt.getTopSellingProducts,
            getNewInProducts: getIt.getNewInProducts,
            getCategories: getIt.getCategories,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Shoppe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF8B5CF6), // Purple color from the design
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          fontFamily: 'SF Pro Display',
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomePage(),
      ),
    );
  }
}
