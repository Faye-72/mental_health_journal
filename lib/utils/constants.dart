// lib/utils/constants.dart

class AppConstants {
  // UI Dimensions
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  static const double cardMarginHorizontal = 16.0;
  static const double cardMarginVertical = 4.0;

  static const double contentInputHeight = 200.0;
  static const double buttonVerticalPadding = 16.0;

  // Form Validation
  static const int titleMaxLength = 100;
  static const int minContentLength = 10;

  // Mood Rating
  static const int moodMin = 1;
  static const int moodMax = 5;
  static const int moodDefault = 3;
  static const int moodDivisions = 4; // For slider

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);

  // Icon Sizes
  static const double smallIconSize = 16.0;
  static const double mediumIconSize = 24.0;
  static const double largeIconSize = 50.0;

  // Text Lengths for Preview
  static const int entryPreviewLength = 100;
}

class AppStrings {
  // App Info
  static const String appTitle = 'Mental Health Journal';

  // Form Labels
  static const String titleHint = 'Give your entry a title...';
  static const String titleLabel = 'Title (optional)';
  static const String contentHint = 'Write your thoughts here...';
  static const String contentLabel = 'How are you feeling today?';
  static const String moodLabel = 'How would you rate your mood?';

  // Buttons
  static const String saveEntry = 'Save Entry';
  static const String updateEntry = 'Update Entry';

  // Messages
  static const String entrySavedSuccess = 'Entry saved successfully!';
  static const String entryUpdatedSuccess = 'Entry updated successfully!';
  static const String saveErrorPrefix = 'Error saving entry: ';

  // Validation Messages
  static const String contentRequiredError =
      'Please write something in your journal';
  static const String contentTooShortError =
      'Please write at least 10 characters';

  // Section Headers
  static const String recentEntriesHeader = 'Recent Entries';
  static const String untitledEntry = 'Untitled Entry';

  // Mood Descriptions
  static const String moodVerySad = 'Very Sad';
  static const String moodSad = 'Sad';
  static const String moodNeutral = 'Neutral';
  static const String moodHappy = 'Happy';
  static const String moodVeryHappy = 'Very Happy';

  // Entry Count
  static const String entriesCountSuffix = ' entries';

  // Mood Display
  static const String moodPrefix = 'Mood: ';
  static const String moodSuffix = '/5';
}
