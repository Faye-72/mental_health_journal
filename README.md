# 🧠 Mental Health Journal - Flutter App

> **Gen AI Capstone Project**: A beginner-friendly Flutter application built using AI-powered learning

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material Design](https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white)

A beautiful, intuitive mobile application for tracking mental health through daily journaling and mood monitoring. Built as part of the Moringa Gen AI Capstone project to demonstrate learning Flutter through AI-guided development.

## 📱 Screenshots

<img width="745" height="781" alt="image" src="https://github.com/user-attachments/assets/1959fb30-4198-4244-b6b9-4c2ef950e889" />


## ✨MVP Features

- 📝 **Create Journal Entries** - Write daily thoughts and reflections
- 😊 **Mood Tracking** - Rate your mood on a 1-5 scale with color visualization  
- 📅 **Date Management** - Automatic date/time stamping with smart formatting
- 🎨 **Beautiful UI** - Material Design 3 with custom theming
- 🔄 **Real-time Updates** - Instant feedback and form validation
- 🎯 **Clean Architecture** - Organized code structure for maintainability

## 🚀 Quick Start

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- IDE: [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- Mobile emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/mental-health-journal.git
   cd mental-health-journal
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### Android
- Ensure Android SDK is installed via Android Studio
- Start an Android emulator or connect a physical device

#### iOS (macOS only)
- Install Xcode from App Store
- Start iOS Simulator or connect an iPhone

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point and home page
├── models/
│   └── journal_entry.dart    # JournalEntry data model
├── widgets/
│   ├── journal/
│   │   └── entry_form.dart   # Main journal entry form
│   └── mood/
│       └── mood_selector.dart # Mood rating component
└── utils/
    ├── constants.dart        # App-wide constants
    ├── theme_data.dart      # Custom theme and colors
    └── date_helpers.dart    # Date formatting utilities
```

## 🎨 Design System

The app follows a consistent design system with:

### Color Palette
- **Primary**: Purple Accent (`#EA80FC`)
- **Success**: Green (`#4CAF50`)  
- **Error**: Red (`#F44336`)
- **Mood Colors**: Dynamic based on rating (1-5)

### Typography
- **Headlines**: Bold, primary color
- **Body**: Regular weight, readable
- **Captions**: Light, secondary color

### Components
- **Forms**: Outlined inputs with validation
- **Buttons**: Elevated with consistent padding
- **Cards**: Rounded corners with subtle shadows

## 🔧 Key Components

### JournalEntry Model
```dart
class JournalEntry {
  final int? id;
  final String? title;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? moodRating;
}
```

### Entry Form Features
- Optional title field
- Required content with validation
- Mood selector (1-5 scale)
- Auto-save functionality
- Loading states and error handling

### Mood Visualization
- Color-coded mood indicators
- Interactive mood selection
- Consistent mood display throughout app


## 📱 Building for Release

### Android APK
```bash
flutter build apk --release
```

### iOS App (macOS only)
```bash
flutter build ios --release
```

## 🤝 Contributing

This project was built as a learning capstone, but contributions are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter/Dart conventions
- Use the existing theme system
- Add constants for new values
- Include proper error handling
- Update documentation as needed

## 🐛 Troubleshooting

### Common Issues

**Flutter not recognized**
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

**iOS build issues**
```bash
cd ios && rm Podfile.lock && pod install && cd ..
```

**Hot reload not working**
- Save all files
- Try hot restart (R in terminal)
- Restart the app completely

## 📚 Learning Resources

This project was built using AI-guided learning. Key resources:

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)


## 🏆 Capstone Project Context

This app was developed as part of the **Moringa Gen AI Capstone Project**: "Prompt-Powered Kickstart: Building a Beginner's Toolkit for Flutter Mobile Development"

### Learning Objectives Met
- ✅ Learned Flutter from scratch using AI guidance
- ✅ Built a MVP, functional mobile application
- ✅ Implemented best practices and clean architecture
- ✅ Created comprehensive documentation for beginners
- ✅ Demonstrated practical AI-assisted learning

### AI Prompts Used
The development process leveraged strategic AI prompts for:
- Understanding Flutter fundamentals
- Building UI components step-by-step
- Implementing form validation and state management
- Code refactoring and organization
- Troubleshooting and debugging

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Faith Mitei**
- GitHub: Faye-72/(https://github.com/Faye-72/)
- LinkedIn: (https://www.linkedin.com/in/faith-chemutai-mitei/)
- Email: faithmitey@gmail.com

## 🙏 Acknowledgments

- **Moringa School** for the capstone project framework
- **Flutter Team** for the amazing framework
- **AI Tools** for guidance throughout the learning process
- **Open Source Community** for inspiration and resources

---

⭐ **Star this repo if it helped you learn Flutter!** ⭐
