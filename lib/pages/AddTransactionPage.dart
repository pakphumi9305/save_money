import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  _AddTransactionPage createState() => _AddTransactionPage();
}

class _AddTransactionPage extends State<AddTransactionPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String date = "";
  Map<DateTime, List<String>> _events = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/icons/budget32px.png', fit: BoxFit.contain),
            const Text('My Transaction'),
          ],
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(DateTime.now().year - 5, 1, 1),
            lastDay: DateTime(DateTime.now().year + 5, 1, 1),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectDay, _focusedDay) {
              setState(() {
                _selectedDay = selectDay;
                _focusedDay = _focusedDay;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedDay == null
            ? null
            : () {
                _showAddEventDialog(_selectedDay!);
              },
        child: Icon(Icons.add),
        backgroundColor: _selectedDay == null ? Colors.grey : Colors.blue,
      ),
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      //   title: Text('Table Calendar Demo'),
      //   // เพิ่มปุ่มกลับไปหน้าที่แล้ว
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (context) => MyApp()),
      //             (Route<dynamic> route) => false,
      //       );
      //     },
      //   ),
      // ),
      // body: Column(
      //   children: [
      //     TableCalendar(
      //       firstDay: DateTime.utc(2010, 10, 16),
      //       lastDay: DateTime.utc(2030, 3, 14),
      //       focusedDay: _focusedDay,
      //       selectedDayPredicate: (day) {
      //         return isSameDay(_selectedDay, day);
      //       },
      //       onDaySelected: (selectedDay, focusedDay) {
      //         setState(() {
      //           _selectedDay = selectedDay;
      //           _focusedDay = focusedDay;
      //         });
      //         //_showAddEventDialog(selectedDay);
      //       },
      //       eventLoader: (day) {
      //         return _events[day] ?? [];
      //       },
      //       calendarStyle: CalendarStyle(
      //         todayDecoration: BoxDecoration(
      //           color: Colors.orange,
      //           shape: BoxShape.circle,
      //         ),
      //         selectedDecoration: BoxDecoration(
      //           color: Colors.blue,
      //           shape: BoxShape.circle,
      //         ),
      //       ),
      //       headerStyle: HeaderStyle(
      //         formatButtonVisible: false,
      //       ),
      //     ),
      //     Expanded(
      //       child: _getEventWidgets(),  // ส่วนแสดงรายการบันทึก
      //     ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _selectedDay == null
      //       ? null
      //       : () {
      //     _showAddEventDialog(_selectedDay!);
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: _selectedDay == null ? Colors.grey : Colors.blue,
      // ),
    );
  }

  void _showAddEventDialog(DateTime selectedDay,
      {String? existingEvent, int? index}) {
    TextEditingController eventController =
        TextEditingController(text: existingEvent ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existingEvent == null ? 'Add Event' : 'Edit Event'),
        content: TextField(
          controller: eventController,
          decoration: InputDecoration(hintText: 'Enter event details'),
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Save'),
            onPressed: () {
              setState(() {
                if (eventController.text.isNotEmpty) {
                  if (existingEvent != null && index != null) {
                    // แก้ไขรายการ
                    _events[selectedDay]![index] = eventController.text;
                  } else {
                    // เพิ่มรายการใหม่
                    if (_events[selectedDay] != null) {
                      _events[selectedDay]!.add(eventController.text);
                    } else {
                      _events[selectedDay] = [eventController.text];
                    }
                  }
                }
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
