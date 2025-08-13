// lib/models/journal_entry.dart

class JournalEntry {
  // Unique identifier for each entry
  final int? id;

  // The main journal text content
  final String content;

  // When the entry was created
  final DateTime createdAt;

  // Optional: when the entry was last modified
  final DateTime? updatedAt;

  // Optional: mood rating (1-5 scale)
  final int? moodRating;

  // Optional: tags or categories
  final List<String>? tags;

  // Optional: entry title/summary
  final String? title;

  // Constructor with required and optional parameters
  JournalEntry({
    this.id,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    this.moodRating,
    this.tags,
    this.title,
  });

  // Factory constructor to create JournalEntry from Map (for database)
  // This is like JSON.parse() in JavaScript
  factory JournalEntry.fromMap(Map<String, dynamic> map) {
    return JournalEntry(
      id: map['id'],
      content: map['content'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'])
          : null,
      moodRating: map['mood_rating'],
      tags: map['tags'] != null
          ? List<String>.from(map['tags'].split(','))
          : null,
      title: map['title'],
    );
  }

  // Convert JournalEntry to Map (for database storage)
  // This is like JSON.stringify() in JavaScript
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'mood_rating': moodRating,
      'tags': tags?.join(','), // Convert list to comma-separated string
      'title': title,
    };
  }

  // Create a copy of this entry with some fields changed
  // Similar to {...object, newField: value} in JavaScript
  JournalEntry copyWith({
    int? id,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? moodRating,
    List<String>? tags,
    String? title,
  }) {
    return JournalEntry(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      moodRating: moodRating ?? this.moodRating,
      tags: tags ?? this.tags,
      title: title ?? this.title,
    );
  }

  // String representation for debugging (like toString() in Java)
  @override
  String toString() {
    return 'JournalEntry(id: $id, title: $title, content: ${content.length} chars, createdAt: $createdAt)';
  }

  // Check if two entries are equal
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JournalEntry &&
        other.id == id &&
        other.content == content &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ content.hashCode ^ createdAt.hashCode;
  }
}
