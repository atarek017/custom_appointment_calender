import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_event_calendar/src/providers/calendares/calendar_provider.dart';
import 'package:flutter_event_calendar/src/providers/calendares/gregorian_calendar.dart';
import 'package:flutter_event_calendar/src/providers/calendares/jalali_calendar.dart';

CalendarProvider createInstance(CalendarType cType) {
  final Map<CalendarType, CalendarProvider> _factories = {
    CalendarType.Jalali: JalaliCalendar(),
    CalendarType.Gregorian: GregorianCalendar()
  };
  if (!_factories.keys.contains(cType)) {
    throw Exception(
        "Cannot create instance of calendar, check available calendar types or create your own calendar that implements BaseCalendarProvider");
  }

  return _factories[cType]!;
}
