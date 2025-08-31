# 🛍️ Shoppe - E-commerce Flutter App

Modern mobile application for online shopping, built with Flutter using **Clean Architecture**.

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

### 📁 Project Structure

```
lib/
├── main.dart                    # Application entry point
├── core/                        # Core functionality
│   ├── constants/              # App constants
│   ├── utils/                  # Utility functions
│   └── errors/                 # Error handling
├── domain/                     # Business Logic Layer
│   ├── entities/               # Business entities
│   │   ├── product.dart
│   │   └── category.dart
│   ├── repositories/           # Repository interfaces
│   │   ├── product_repository.dart
│   │   └── category_repository.dart
│   └── usecases/              # Business use cases
│       ├── get_top_selling_products.dart
│       ├── get_new_in_products.dart
│       └── get_categories.dart
├── data/                       # Data Layer
│   ├── datasources/           # Data sources
│   │   ├── product_local_datasource.dart
│   │   └── category_local_datasource.dart
│   ├── models/                # Data models
│   │   ├── product_model.dart
│   │   └── category_model.dart
│   └── repositories/          # Repository implementations
│       ├── product_repository_impl.dart
│       └── category_repository_impl.dart
├── presentation/              # Presentation Layer
│   ├── pages/                # UI pages
│   │   ├── home_page.dart
│   │   └── product_detail_page.dart
│   ├── widgets/              # Reusable widgets
│   │   ├── bottom_navigation.dart
│   │   ├── categories_section.dart
│   │   ├── custom_app_bar.dart
│   │   ├── products_section.dart
│   │   └── search_bar.dart
│   ├── providers/            # State management
│   │   └── home_provider.dart
│   └── controllers/          # UI controllers
└── di/                       # Dependency Injection
    └── injection_container.dart
```

## 🎯 Clean Architecture Benefits

### ✅ **Separation of Concerns**
- **Domain Layer**: Pure business logic, no dependencies on external frameworks
- **Data Layer**: Data handling and external API interactions
- **Presentation Layer**: UI and user interactions

### ✅ **Testability**
- Each layer can be tested independently
- Business logic is isolated from UI and data concerns
- Easy to mock dependencies

### ✅ **Maintainability**
- Clear structure makes code easy to understand and modify
- Changes in one layer don't affect others
- Scalable architecture for large applications

### ✅ **Dependency Rule**
- Dependencies point inward: Presentation → Domain ← Data
- Domain layer has no dependencies on external frameworks
- Data layer depends only on Domain layer

## ✨ Features

- **Modern Design** - Material 3 with minimalist interface
- **Clean Architecture** - Well-structured, maintainable code
- **State Management** - Provider pattern for reactive UI
- **Animations** - Smooth transitions and animations
- **Responsive Interface** - Works on all screen sizes
- **Russian Localization** - Fully in Russian language
- **Image Carousel** - Beautiful product gallery
- **Interactive Elements** - Responsive interface

## 🚀 Technologies

- **Flutter** - Main framework
- **Dart** - Programming language
- **Clean Architecture** - Software architecture pattern
- **Provider** - State management
- **Material Design 3** - Design system
- **Custom Animations** - Smooth transitions

## 📱 Functionality

### Home Screen
- SliverAppBar with scroll hiding
- Search bar
- Product categories
- "Top Selling" and "New In" sections
- Animated product cards
- Loading states and error handling

### Product Detail Screen
- Image carousel with indicators
- Size, color, and quantity selectors
- Product description
- User reviews
- "Add to Cart" button

### Navigation
- Minimalist bottom navigation
- Smooth transitions between screens
- Animated icons

## 🛠️ Installation and Setup

1. Clone the repository:
```bash
git clone https://github.com/yer9ali/shoppe.git
```

2. Navigate to the project folder:
```bash
cd shoppe
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the application:
```bash
flutter run
```

## 🧪 Testing

The Clean Architecture makes testing straightforward:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 🎯 Development Plans

- [ ] Unit tests for Domain layer
- [ ] Integration tests for Data layer
- [ ] Widget tests for Presentation layer
- [ ] Shopping cart implementation
- [ ] Authentication system
- [ ] Favorite products
- [ ] Filtering and sorting
- [ ] Push notifications
- [ ] Dark theme
- [ ] API integration
- [ ] Local storage with Hive/SharedPreferences

## 📄 License

This project is created for educational purposes.

## 👨‍💻 Author

Created with ❤️ for learning Flutter Clean Architecture and building a beautiful e-commerce application.
