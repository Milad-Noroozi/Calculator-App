# 🧮 Flutter Calculator

A beautiful and functional calculator app built with Flutter using clean architecture principles.

## ✨ Features

- 🎨 **Beautiful UI** with dark theme
- 🔢 **Complete Calculator** with all basic operations (+, -, ×, ÷, %)
- 🏗️ **Clean Architecture** with separated concerns
- 📱 **Responsive Design** that works on all screen sizes
- 🔄 **Real-time Calculations** with proper operator precedence
- 🎯 **Error Handling** for division by zero and invalid operations
- 🌐 **Persian Language Support**

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=2.17.0)
- Dart (>=2.17.0)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Milad-Noroozi/Calculator-App.git
   cd Calculator-App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── screens/
│   └── calculator_screen.dart   # Main calculator screen
├── widgets/
│   ├── calculator_display.dart  # Display component
│   ├── calculator_buttons.dart  # Button grid component
│   └── square_button.dart       # Individual button widget
├── services/
│   └── calculator_service.dart  # Business logic & calculations
└── utils/
    └── constants.dart           # App constants & colors
```

## 🎯 Key Features

### Clean Architecture
- **Separation of Concerns**: Each component has a single responsibility
- **Reusable Widgets**: Modular components that can be reused
- **Business Logic Separation**: Calculator logic separated from UI
- **Easy Testing**: Each layer can be tested independently

### Advanced Calculator Features
- **Operator Precedence**: Multiplication and division before addition and subtraction
- **Decimal Support**: Handle decimal numbers correctly
- **Percentage Calculations**: Built-in percentage operations
- **Error Handling**: Graceful handling of invalid operations
- **Memory Management**: Efficient state management

### UI/UX Features
- **Dark Theme**: Modern dark interface
- **Responsive Layout**: Works on all screen sizes
- **Smooth Animations**: Button press feedback
- **Persian Language**: Localized interface
- **Accessibility**: Screen reader friendly

## 🛠️ Built With

- **Flutter** - UI framework
- **Dart** - Programming language
- **Material Design** - Design system

## 📱 Screenshots

![Image](https://github.com/user-attachments/assets/6123cb9b-f64b-4bca-883e-b8dae8b0a262)

## 🔧 Customization

### Colors
You can customize the app colors in `lib/utils/constants.dart`:

```dart
class AppColors {
  static const Color background = Color.fromARGB(255, 23, 23, 28);
  static const Color numberButton = Color.fromARGB(255, 46, 47, 56);
  static const Color operatorButton = Color.fromARGB(255, 75, 94, 252);
  // ... more colors
}
```

### Button Sizes
Adjust button sizes in the same file:

```dart
class AppSizes {
  static const double buttonSize = 80.0;
  static const double buttonBorderRadius = 20.0;
  // ... more sizes
}
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for the design guidelines
- The Dart community for helpful packages

## 📈 Future Enhancements

- [ ] Scientific calculator mode
- [ ] History of calculations
- [ ] Themes (Light/Dark toggle)
- [ ] Landscape mode support
- [ ] Voice input
- [ ] Unit conversions
- [ ] Memory functions (M+, M-, MR, MC)

---

⭐ **If you like this project, please give it a star!** ⭐