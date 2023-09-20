import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  final String location;
  final String batch;
  final String degree;
  final Timestamp date;
  final String endTime;
  final String moduleCode;
  final String startTime;
  String? lecturerName; // To store lecturer's name

  Schedule({
    required this.location,
    required this.batch,
    required this.degree,
    required this.date,
    required this.endTime,
    required this.moduleCode,
    required this.startTime,
  });
}
