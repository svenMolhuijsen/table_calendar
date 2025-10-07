// Example of how to use the accessibility extensions in your calendar_item.dart

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ExampleCalendarItem extends StatelessWidget {
  const ExampleCalendarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now(),
      calendarBuilders: CalendarBuilders(
        // Example of how to add semantics to your custom builders
        selectedBuilder: (context, day, focusedDay) {
          final isOutside = day.month != focusedDay.month;
          
          return day.toAccessibleSemantics(
            isSelected: true,
            isOutside: isOutside,
            onTap: () {
              // Handle tap
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
        
        todayBuilder: (context, day, focusedDay) {
          final isOutside = day.month != focusedDay.month;
          
          return day.toAccessibleSemantics(
            isToday: true,
            isOutside: isOutside,
            onTap: () {
              // Handle tap
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
        
        disabledBuilder: (context, day, focusedDay) {
          final isOutside = day.month != focusedDay.month;
          
          return day.toAccessibleSemantics(
            isDisabled: true,
            isOutside: isOutside,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
          );
        },
        
        defaultBuilder: (context, day, focusedDay) {
          final isOutside = day.month != focusedDay.month;
          
          return day.toAccessibleSemantics(
            isOutside: isOutside,
            onTap: () {
              // Handle tap
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: isOutside ? Colors.grey : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
        
        // For outside days, you can explicitly exclude semantics
        outsideBuilder: (context, day, focusedDay) {
          return day.toAccessibleSemantics(
            isOutside: true, // This will exclude semantics
            child: Container(
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
