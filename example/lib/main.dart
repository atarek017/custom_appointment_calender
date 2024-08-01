import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFF42BDAE),
      body: Expanded(
        child: EventCalendar(
          headerMonthStringType: HeaderMonthStringTypes.Full,
          headerMonthColor: Colors.white,
          dayEventCountTextColor: Colors.white,
          dayIndexSelectedBackgroundColor: Colors.white.withOpacity(.77),
          dayIndexSelectedForegroundColor: Colors.black,
          dayIndexUnelectedForegroundColor: Colors.white,
          weekDaySelectedColor: Colors.black,
          weekDayUnselectedColor: Colors.white,
          dayEventCountColor: Colors.blue,
          dateTime: DateTime.now().toString(),
          headerWeekDayStringType: HeaderWeekDayStringTypes.Short,
          dayEventCountViewType: DayEventCountViewType.DOT,
          calendarType: CalendarType.Gregorian,
          viewType: CalendarViewType.Daily,
          canSelectViewType: true,
          showEvents: true,
          events: [
            Event(
              title: 'Laravel Event 1',
              description:
                  'The largest Laravel event of the year, streamed directly to you. We’ve put together a full day of talks featuring some of Laravel’s brightest minds, and streaming them directly to your home or office.',
              dateTime: '2024-08-01 21:00',
              time: '8:00 PM',
              status: 'pending',
              statusId: '1',
            ),
            Event(
              title: 'Laravel Event 2',
              description:
                  'The largest Laravel event of the year, streamed directly to you. We’ve put together a full day of talks featuring some of Laravel’s brightest minds, and streaming them directly to your home or office.',
              dateTime: '2024-08-01 22:00',
              time: '8:00 PM',
              status: 'pending',
              statusId: '2',
            ),
            Event(
              title: 'Laravel Event 3',
              description:
                  'The largest Laravel event of the year, streamed directly to you. We’ve put together a full day of talks featuring some of Laravel’s brightest minds, and streaming them directly to your home or office.',
              dateTime: '2024-08-01 23:00',
              time: '8:00 PM',
              status: 'pending',
              statusId: '3',
            ),
            Event(
              title: 'Laravel Event 4',

              description:
                  'The largest Laravel event of the year, streamed directly to you. We’ve put together a full day of talks featuring some of Laravel’s brightest minds, and streaming them directly to your home or office.',
              dateTime: '2024-08-02 20:00',
              time: '8:00 PM',
              status: 'pending',
              statusId: '4',
            ),
          ],
          emptyText: 'There is no Appointment This Day',

          getCurrentSelectedDay: (day, month, year) {
            print('day: $day, month: $month, year: $year');

          },
          eventBuilder: (context, events) {
            return Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(events[index].title),
                      subtitle: Text(events[index].description),
                    );
                  },
                ),
              ),
            );
          }, onMonthChanged: () {  },
        ),
      ),
    );
  }
}
