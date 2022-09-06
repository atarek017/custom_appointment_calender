import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/src/handlers/EventCalendar.dart';
import 'package:flutter_event_calendar/src/handlers/Event.dart';
import 'package:flutter_event_calendar/src/widgets/upcoming_date_time.dart';

class EventCard extends StatelessWidget {
  Event fullCalendarEvent;
  final int appoinmentCount;

  EventCard({required this.fullCalendarEvent, required this.appoinmentCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7, right: 7),
      child: GestureDetector(
        onTap: (() {
          fullCalendarEvent.onTap.call(fullCalendarEvent.listIndex);
        }),
        onLongPress: (() {
          fullCalendarEvent.onLongPress.call(fullCalendarEvent.listIndex);
        }),
        child:
        Container(
          // width:  context.width * .85,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color(0xffFBFBFB),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff727A83).withOpacity(.4),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: Column(
            crossAxisAlignment: EventCalendar.calendarProvider.isRTL()
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              UpcomingDateTime(
                date: fullCalendarEvent.dateTime,
                appoinmentCount: appoinmentCount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}