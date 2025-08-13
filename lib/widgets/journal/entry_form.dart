// lib/widgets/journal/entry_form.dart

import 'package:flutter/material.dart';
import '../../models/journal_entry.dart';
import '../../utils/constants.dart';
import '../../utils/theme_data.dart';
import '../mood/mood_selector.dart';

class JournalEntryForm extends StatefulWidget {
  // Optional: existing entry for editing
  final JournalEntry? existingEntry;

  // Callback function when entry is saved
  final Function(JournalEntry) onSave;

  const JournalEntryForm({super.key, this.existingEntry, required this.onSave});

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  // Text controllers (like React useRef for form inputs)
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // Form validation key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // State variables
  int _moodRating = AppConstants.moodDefault; // Use constant for default mood
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // If editing existing entry, populate the form
    if (widget.existingEntry != null) {
      _titleController.text = widget.existingEntry!.title ?? '';
      _contentController.text = widget.existingEntry!.content;
      _moodRating =
          widget.existingEntry!.moodRating ?? AppConstants.moodDefault;
    }
  }

  @override
  void dispose() {
    // Clean up controllers when widget is destroyed
    // Similar to useEffect cleanup in React
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  // Handle form submission
  void _saveEntry() async {
    // Validate form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Create new entry
      final entry = JournalEntry(
        id: widget.existingEntry?.id, // Keep existing ID if editing
        title: _titleController.text.trim().isEmpty
            ? null
            : _titleController.text.trim(),
        content: _contentController.text.trim(),
        createdAt: widget.existingEntry?.createdAt ?? DateTime.now(),
        updatedAt: widget.existingEntry != null ? DateTime.now() : null,
        moodRating: _moodRating,
      );

      // Call the callback function with the new entry
      widget.onSave(entry);

      // Clear form after successful save
      if (widget.existingEntry == null) {
        _titleController.clear();
        _contentController.clear();
        setState(() {
          _moodRating = AppConstants.moodDefault;
        });
      }

      // Show success message using theme colors and constants
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.existingEntry == null
                  ? AppStrings.entrySavedSuccess
                  : AppStrings.entryUpdatedSuccess,
            ),
            backgroundColor: AppTheme.successGreen,
          ),
        );
      }
    } catch (error) {
      // Show error message using theme colors and constants
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppStrings.saveErrorPrefix}$error'),
            backgroundColor: AppTheme.errorRed,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title input (optional)
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: AppStrings.titleLabel,
                  hintText: AppStrings.titleHint,
                  prefixIcon: Icon(Icons.title),
                ),
                maxLength: AppConstants.titleMaxLength,
              ),

              const SizedBox(height: AppConstants.defaultPadding),

              // Main content input
              SizedBox(
                height: AppConstants.contentInputHeight,
                child: TextFormField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.contentLabel,
                    hintText: AppStrings.contentHint,
                    alignLabelWithHint: true,
                  ),
                  maxLines: null, // Allow multiple lines
                  expands: true, // Fill the container
                  textAlignVertical: TextAlignVertical.top,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.contentRequiredError;
                    }
                    if (value.trim().length < AppConstants.minContentLength) {
                      return AppStrings.contentTooShortError;
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: AppConstants.defaultPadding),

              // Mood rating selector
              MoodSelector(
                currentRating: _moodRating,
                onRatingChanged: (newRating) {
                  setState(() {
                    _moodRating = newRating;
                  });
                },
              ),

              const SizedBox(height: AppConstants.largePadding),

              // Save button - now uses theme styling automatically
              ElevatedButton(
                onPressed: _isLoading ? null : _saveEntry,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        widget.existingEntry == null
                            ? AppStrings.saveEntry
                            : AppStrings.updateEntry,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
