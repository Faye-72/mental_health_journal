// lib/widgets/mood/mood_selector.dart

import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/theme_data.dart';

class MoodSelector extends StatelessWidget {
  // Properties (like React props)
  final int currentRating;
  final ValueChanged<int> onRatingChanged;
  final String? title;

  const MoodSelector({
    super.key,
    required this.currentRating,
    required this.onRatingChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ?? AppStrings.moodLabel, style: AppTheme.bodyLarge),
            const SizedBox(height: AppConstants.smallPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('😢'),
                Expanded(
                  child: Slider(
                    value: currentRating.toDouble(),
                    min: AppConstants.moodMin.toDouble(),
                    max: AppConstants.moodMax.toDouble(),
                    divisions: AppConstants.moodDivisions,
                    onChanged: (value) {
                      onRatingChanged(value.round());
                    },
                  ),
                ),
                const Text('😊'),
              ],
            ),
            Center(
              child: Text(
                _getMoodText(currentRating),
                style: AppTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method moved from the form
  String _getMoodText(int rating) {
    switch (rating) {
      case 1:
        return AppStrings.moodVerySad;
      case 2:
        return AppStrings.moodSad;
      case 3:
        return AppStrings.moodNeutral;
      case 4:
        return AppStrings.moodHappy;
      case 5:
        return AppStrings.moodVeryHappy;
      default:
        return AppStrings.moodNeutral;
    }
  }
}
