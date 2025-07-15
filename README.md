# 📱 Product List App

> A modern Flutter application for browsing and searching products with smooth animations and intuitive user experience.

## 🚀 Features

### 🔍 **Smart Search System**
- **Real-time Search**: Type in the search bar to find products instantly
- **Recent Searches**: Your last 5 searches are saved and displayed as clickable chips
- **Smart Suggestions**: Tap on any recent search chip to quickly search again
- **Clear History**: Recent searches are stored locally and persist between app sessions

### 📋 **Product Display**
- **Clean Cards**: Products displayed in attractive white cards with shadows
- **Rich Information**: Each card shows product image, title, and price
- **Error Handling**: Graceful fallback when product images fail to load
- **Responsive Layout**: Cards adapt beautifully to different screen sizes

### ⚡ **Performance Features**
- **Loading Animation**: Shimmer effect while products are being fetched
- **Pull-to-Refresh**: Swipe down on the product list to refresh data
- **Efficient API Calls**: Smart caching and optimized network requests
- **Smooth Animations**: Subtle animations enhance user experience

### 🎨 **User Experience**
- **Intuitive Interface**: Clean, modern design following Material Design principles
- **Visual Feedback**: Cards respond to touch with scale animations
- **Empty States**: Helpful messages when no products are found
- **Error Handling**: User-friendly error messages with retry options

## 🛠️ Technical Architecture

### **Design Pattern: MVC with GetX**
- **Model**: `Product` and `Category` data models
- **View**: UI components and screens
- **Controller**: `ProductController` manages state and business logic
- **Dependency Injection**: GetX bindings for clean architecture

### **State Management**
- **GetX**: Reactive state management for real-time UI updates
- **Observable Variables**: Products, search results, and loading states
- **Local Storage**: SharedPreferences for persisting recent searches

### **Key Dependencies**
- `get: ^4.7.2` - State management and dependency injection
- `http: ^1.4.0` - API communication
- `shared_preferences: ^2.5.3` - Local data persistence
- `shimmer: ^3.0.0` - Loading animations

## 📖 How to Use the App

### **🔍 Searching for Products**
1. **Type to Search**: Enter any product name in the search bar
2. **Submit Search**: Either press Enter or tap the search icon
3. **Quick Access**: Recent searches appear as chips below the search bar
4. **Tap Chips**: Click any recent search chip to search again instantly

### **📱 Browsing Products**
1. **Scroll Through**: Browse all products in the main list
2. **Refresh Data**: Pull down on the list to refresh products from the server
3. **View Details**: Each card shows product image, title, and price
4. **Touch Feedback**: Cards scale slightly when tapped for visual feedback

### **⚡ App Interactions**
- **Pull to Refresh**: Swipe down on the product list to get fresh data
- **Search History**: Your last 5 searches are automatically saved
- **Real-time Results**: Search results update as you type
- **Offline Persistence**: Recent searches are saved even after closing the app

### **🎯 Visual Cues**
- **Shimmer Loading**: Gray shimmer cards appear while loading products
- **Empty State**: "No products found" message with search icon when no results
- **Error Handling**: Snackbar notifications for network or API errors
- **Touch Animations**: Cards provide visual feedback when interacted with

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point
└── product_screen/
    ├── bindings/
    │   └── binding.dart               # GetX dependency injection
    ├── controller/
    │   └── product_controller.dart    # Business logic & state management
    ├── models/
    │   └── product.dart              # Data models (Product & Category)
    ├── widgets/
    │   ├── product_card.dart         # Individual product card widget
    │   └── shimmerCard.dart          # Loading animation widget
    └── product_list.dart             # Main screen UI
```

## 🔧 Setup Instructions

### **Prerequisites**
- Flutter SDK (>=3.8.1)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device

### **Installation**
1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd webplat_assignment
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### **Build for Release**
```bash
# Android APK
flutter build apk --release

# iOS (requires macOS)
flutter build ios --release
```

## 🌐 API Integration

**Base URL**: `https://api.escuelajs.co/api/v1/products`

### **Endpoints Used**
- `GET /products` - Fetch all products
- `GET /products?title={query}` - Search products by title

### **Response Format**
```json
{
  "id": 1,
  "title": "Product Name",
  "price": 99,
  "description": "Product description",
  "images": ["image1.jpg", "image2.jpg"],
  "category": {
    "id": 1,
    "name": "Category Name",
    "image": "category.jpg"
  }
}
```

## 🎨 UI/UX Features

### **Design Principles**
- **Material Design**: Follows Google's Material Design guidelines
- **Accessibility**: Proper contrast ratios and touch targets
- **Responsiveness**: Adapts to different screen sizes
- **Performance**: Optimized animations and smooth scrolling

### **Animation Details**
- **Staggered Loading**: Products animate in sequence for better visual flow
- **Touch Feedback**: Cards scale down when pressed (0.95x scale)
- **Smooth Transitions**: 150ms duration for natural feeling interactions
- **Loading States**: Shimmer effect with realistic card layout



## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Built with ❤️ using Flutter & GetX**
