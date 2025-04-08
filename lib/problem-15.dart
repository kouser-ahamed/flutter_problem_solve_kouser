import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DateTimeSelectorScreen(),
    );
  }
}

class DateTimeSelectorScreen extends StatefulWidget {
  const DateTimeSelectorScreen({super.key});

  @override
  State<DateTimeSelectorScreen> createState() => _DateTimeSelectorScreenState();
}

class _DateTimeSelectorScreenState extends State<DateTimeSelectorScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> chooseDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  Future<void> chooseTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => selectedTime = time);
    }
  }

  String get displayDate {
    if (selectedDate == null) return "Please Select a Date";
    return "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}";
  }

  String get displayTime {
    if (selectedTime == null) return "Please Select a Time";
    final h = selectedTime!.hour.toString().padLeft(2, '0');
    final m = selectedTime!.minute.toString().padLeft(2, '0');
    return "$h:$m";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A1B9A),
        title: const Center(
          child: Text(
            'Date And Time',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'DMSans',
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: chooseDate,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00897B),
                foregroundColor: Colors.white,
              ),
              child: const Text("Select Date"),
            ),
            const SizedBox(height: 10),
            Text(
              displayDate,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF00695C),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: chooseTime,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD84315),
                foregroundColor: Colors.white,
              ),
              child: const Text("Select Time"),
            ),
            const SizedBox(height: 10),
            Text(
              displayTime,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFFBF360C),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
