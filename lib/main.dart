// lib/main.dart

import 'package:flutter/material.dart';
import 'models/journal_entry.dart';
import 'widgets/journal/entry_form.dart';
import 'utils/constants.dart';
import 'utils/theme_data.dart';
import 'utils/date_helpers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: AppTheme.lightTheme, // Use your custom theme
      home: const JournalHomePage(),
    );
  }
}

class JournalHomePage extends StatefulWidget {
  const JournalHomePage({super.key});

  @override
  State<JournalHomePage> createState() => _JournalHomePageState();
}

class _JournalHomePageState extends State<JournalHomePage> {
  // List to store journal entries (temporary - later we'll use database)
  List<JournalEntry> _entries = [];

  // Handle saving a new entry
  void _handleSaveEntry(JournalEntry entry) {
    setState(() {
      if (entry.id == null) {
        // New entry - add to list with generated ID
        final newEntry = entry.copyWith(id: _entries.length + 1);
        _entries.add(newEntry);
      } else {
        // Update existing entry
        final index = _entries.indexWhere((e) => e.id == entry.id);
        if (index != -1) {
          _entries[index] = entry;
        }
      }
    });

    // Print entry for debugging (you can see this in your IDE's debug console)
    print('Saved entry: ${entry.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        actions: [
          // Show number of entries
          Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Center(
              child: Text(
                '${_entries.length}${AppStrings.entriesCountSuffix}',
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Entry form takes most of the screen
          Expanded(flex: 3, child: JournalEntryForm(onSave: _handleSaveEntry)),

          // Recent entries section
          if (_entries.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
              ),
              child: Divider(thickness: 1, color: AppTheme.dividerLight),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    child: Text(
                      AppStrings.recentEntriesHeader,
                      style: AppTheme.headlineMedium,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _entries.length,
                      itemBuilder: (context, index) {
                        final entry =
                            _entries[_entries.length -
                                1 -
                                index]; // Show newest first
                        return _buildEntryCard(entry);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Extract entry card building into separate method
  Widget _buildEntryCard(JournalEntry entry) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.cardMarginHorizontal,
        vertical: AppConstants.cardMarginVertical,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          entry.title ?? AppStrings.untitledEntry,
          style: AppTheme.bodyLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.content.length > AppConstants.entryPreviewLength
                  ? '${entry.content.substring(0, AppConstants.entryPreviewLength)}...'
                  : entry.content,
              style: AppTheme.bodyMedium,
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Row(
              children: [
                Icon(
                  Icons.sentiment_satisfied,
                  size: AppConstants.smallIconSize,
                  color: MoodColors.getMoodColor(
                    entry.moodRating ?? AppConstants.moodDefault,
                  ),
                ),
                const SizedBox(width: AppConstants.smallPadding),
                Text(
                  '${AppStrings.moodPrefix}${entry.moodRating ?? AppConstants.moodDefault}${AppStrings.moodSuffix}',
                  style: AppTheme.caption,
                ),
                const Spacer(),
                Text(
                  DateHelpers.formatSimpleDate(entry.createdAt),
                  style: AppTheme.caption,
                ),
              ],
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
