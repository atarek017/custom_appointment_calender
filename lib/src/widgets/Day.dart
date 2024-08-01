import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_event_calendar/src/handlers/EventSelector.dart';

class Day extends StatelessWidget {
  final int dayIndex;
  final int month;
  final int year;
  final String weekDay;
  final bool selected;
  final Function? onCalendarChanged;
  final bool mini;
  final bool showEvents;

  final bool useUnselectedEffect;

  Day(
      {required this.month,
      required this.dayIndex,
      required this.year,
      required this.weekDay,
      required this.selected,
      this.useUnselectedEffect = false,
      this.mini = true,
      this.onCalendarChanged,
      this.showEvents = false})
      : super();

  late Widget child;

  late List<Event> todayEvents =
      EventSelector().getEventsByDayMonthYear(year, month, dayIndex);
  late Color textColor = selected
      ? EventCalendar.dayIndexSelectedForegroundColor
      : (useUnselectedEffect
          ? EventCalendar.dayIndexUnelectedForegroundColor.withOpacity(0.2)
          : EventCalendar.dayIndexUnelectedForegroundColor);

  @override
  Widget build(BuildContext context) {
    child = InkWell(
      onTap: (() {
        onCalendarChanged?.call();
      }),
      child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!mini)
                  Text(
                    '$weekDay',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selected
                          ? EventCalendar.weekDaySelectedColor
                          : EventCalendar.weekDayUnselectedColor,
                      fontFamily: EventCalendar.font,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                Text(
                  '$dayIndex',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: EventCalendar.font,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (showEvents)
            Align(
              alignment: EventCalendar.dayEventCountViewType ==
                      DayEventCountViewType.DOT
                  ? Alignment.bottomCenter
                  : Alignment.bottomRight,
              child: EventCalendar.dayEventCountViewType ==
                      DayEventCountViewType.DOT
                  ? dotMaker()
                  : labelMaker(),
            ),
        ],
      ),
    );

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
      decoration: BoxDecoration(
        color: selected
            ? EventCalendar.dayIndexSelectedBackgroundColor
            : EventCalendar.dayIndexUnselectedBackgroundColor,
        borderRadius: BorderRadius.circular(9),
      ),
      width: mini
          ? 45
          : (EventCalendar.headerWeekDayStringType ==
                  HeaderWeekDayStringTypes.Full
              ? 80
              : 50),
      child: child,
    );
  }

  dotMaker() {
    List<Widget> widgets = [];

    final maxDot = min(todayEvents.length, 3);
    for (int i = 0; i < maxDot; i++) {
      widgets.add(
        Container(
          margin: EdgeInsets.only(
              bottom: EventCalendar.headerWeekDayStringType ==
                      HeaderWeekDayStringTypes.Short
                  ? 4
                  : 2),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: useUnselectedEffect
                ? EventCalendar.dayEventCountColor.withOpacity(0.4)
                : EventCalendar.dayEventCountColor,
          ),
        ),
      );
      if (i != maxDot - 1)
        widgets.add(
          SizedBox(
            width: 2,
          ),
        );
    }
    return Row(mainAxisSize: MainAxisSize.min, children: widgets);
  }

  labelMaker() {
    if (todayEvents.isEmpty) return Container();
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: useUnselectedEffect
            ? EventCalendar.dayEventCountColor.withOpacity(0.3)
            : EventCalendar.dayEventCountColor,
      ),
      child: Text(
        "${todayEvents.length >= 10 ? '+9' : todayEvents.length}",
        style: TextStyle(
            fontSize: 10,
            fontFamily: EventCalendar.font,
            color: useUnselectedEffect
                ? EventCalendar.dayEventCountTextColor.withOpacity(0.3)
                : EventCalendar.dayEventCountTextColor),
      ),
    );
  }
}
