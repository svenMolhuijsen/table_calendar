# Table Calendar Accessibility Changes

## Problem
The original table calendar was applying semantics labels to all days, including days outside the current month (isOutside = true). This caused accessibility issues where screen readers would announce days that weren't visible or interactive.

## Solution
1. **Removed automatic semantics from CellContent**: The `CellContent` widget no longer automatically applies `Semantics` wrappers to calendar cells.

2. **Created DateTimeAccessibilityExtensions**: Added a new extension that provides proper accessibility handling with the ability to exclude semantics for outside days.

3. **Full control to calendar_item.dart**: Now the semantics are fully determined by your custom builders in `calendar_item.dart`.

## Changes Made

### 1. Modified `lib/src/widgets/cell_content.dart`
- Removed all automatic `Semantics` wrapping
- Now returns raw widgets that can be wrapped with semantics by the parent

### 2. Created `lib/src/widgets/date_time_accessibility_extensions.dart`
- `toAccessibilityDescription()`: Generates proper accessibility labels
- `toAccessibleSemantics()`: Wraps widgets with appropriate semantics
- Automatically excludes semantics for outside days when `isOutside = true`

### 3. Updated `lib/table_calendar.dart`
- Exported the new accessibility extensions

## Usage in your calendar_item.dart

Now you can use the extension in your custom builders:

```dart
selectedBuilder: (context, day, focusedDay) {
  final isOutside = day.month != focusedDay.month;
  
  return day.toAccessibleSemantics(
    isSelected: true,
    isOutside: isOutside,
    onTap: () => handleDayTap(day),
    child: YourCustomSelectedDayWidget(day: day),
  );
},

outsideBuilder: (context, day, focusedDay) {
  return day.toAccessibleSemantics(
    isOutside: true, // This will exclude semantics
    child: YourCustomOutsideDayWidget(day: day),
  );
},
```

## Benefits
- Days outside the current month no longer have accessibility labels
- Full control over semantics in your calendar_item.dart
- Consistent with your existing date_time_accessibility_extensions.dart format
- Screen readers will only announce relevant, interactive days
