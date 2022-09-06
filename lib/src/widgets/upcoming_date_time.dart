import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class UpcomingDateTime extends StatelessWidget {
  final String date;
  final int appoinmentCount;

  const UpcomingDateTime({Key? key,
    required this.date,
    required this.appoinmentCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.access_time, color: Colors.black),
          Text(
            date,
            style: TextStyle(
                fontSize: 13,
                color: EventCalendar.dayIndexSelectedBackgroundColor
            ),
          ),

          SizedBox(width: 40,),
          CircleAvatar(
            foregroundColor: Colors.green.shade900,
            child: Text(
                "$appoinmentCount", style: TextStyle(color: Colors.white)),
          )
        ],

      );
  }


}
