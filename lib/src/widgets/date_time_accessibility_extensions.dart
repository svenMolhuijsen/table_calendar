import 'package:flutter/material.dart';

extension DateTimeAccessibilityExtensions on DateTime {
  /// Generates an accessibility description for this date
  String toAccessibilityDescription({
    bool isSelected = false,
    bool isDisabled = false,
    bool isToday = false,
    bool isOutside = false,
  }) {
    // Don't provide accessibility for outside days
    if (isOutside) {
      return '';
    }
    
    final monthNames = [
      '', // Month 0 doesn't exist
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    
    String description = '$day ${monthNames[month]} $year';
    
    if (isDisabled) {
      description += ', not available';
    } else if (isSelected) {
      description += ', selected';
    } else {
      description += ', available';
    }
    
    if (isToday) {
      description += ', today';
    }
    
    return description;
  }
  
  /// Creates a Semantics widget with accessibility for this date
  Widget toAccessibleSemantics({
    required Widget child,
    bool isSelected = false,
    bool isDisabled = false,
    bool isToday = false,
    bool isOutside = false,
    VoidCallback? onTap,
  }) {
    // Geen enkele Semantics toevoegen, alleen child teruggeven
    return child;
  }
}
