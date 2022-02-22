import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  State<Calendar> createState() => _calendarState();

}

class MeetingDataSource extends CalendarDataSource{

  MeetingDataSource (List <Appointment> source) {

    appointments = source;
  }

}

List <Appointment> getAppointments() {

  List <Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year,today.month,today.day,9,0,0);

  final DateTime endTime = startTime.add(const Duration(hours: 2 ));
  
  meetings.add(Appointment(startTime: startTime, endTime: endTime,
      subject: 'Meet my Therapist', color: Colors.blue, recurrenceRule: 'FREQ=DAILY; COUNT=10'));

  return meetings;

}



class _calendarState extends State<Calendar> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 6,
        dataSource: MeetingDataSource(getAppointments()),
      ),

    );
  }

}