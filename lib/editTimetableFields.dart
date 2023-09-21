import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/updateTimetable.dart';
import 'package:intl/intl.dart';

class EditSchedulePage extends StatefulWidget {
  final Map<String, dynamic> scheduleData;

  const EditSchedulePage({Key? key, required this.scheduleData})
      : super(key: key);

  @override
  _EditSchedulePageState createState() => _EditSchedulePageState();
}

class _EditSchedulePageState extends State<EditSchedulePage> {
  TextEditingController batchController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController moduleCodeController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Timestamp timestamp = widget.scheduleData['date'] as Timestamp;
    DateTime dateTime = timestamp.toDate();
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    // Populate the text controllers with existing data
    batchController.text = widget.scheduleData['batch'];
    locationController.text = widget.scheduleData['Location'];
    dateController.text = formattedDate;
    moduleCodeController.text = widget.scheduleData['module-code'];
    degreeController.text = widget.scheduleData['degree'];
    startTimeController.text = widget.scheduleData['start-time'];
    endTimeController.text = widget.scheduleData['end-time'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Use the back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const UpdateSchedulePage()),
            );
          },
        ),
        title: const Text("Edit Schedule"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Batch"),
              TextField(controller: batchController),
              const SizedBox(height: 16.0),
              const Text("Location"),
              TextField(controller: locationController),
              const SizedBox(height: 16.0),
              const Text("Date"),
              TextField(controller: dateController),
              const SizedBox(height: 16.0),
              const Text("Module Code"),
              TextField(controller: moduleCodeController),
              const SizedBox(height: 16.0),
              const Text("Degree"),
              TextField(controller: degreeController),
              const SizedBox(height: 16.0),
              const Text("Start Time"),
              TextField(controller: startTimeController),
              const SizedBox(height: 16.0),
              const Text("End Time"),
              TextField(controller: endTimeController),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  debugPrint(
                      'Document ID to update: ${widget.scheduleData['id']}');
                  // Update the Firestore document with the new values
                  // Retrieve the new values from the text controllers
                  String newBatch = batchController.text;
                  String newLocation = locationController.text;

                  // Parse the date string and create a Timestamp
                  Timestamp newDate =
                      Timestamp.fromDate(DateTime.parse(dateController.text));

                  String newModuleCode = moduleCodeController.text;
                  String newDegree = degreeController.text;
                  String newStartTime = startTimeController.text;
                  String newEndTime = endTimeController.text;

                  // Update the Firestore document with the new values
                  FirebaseFirestore.instance
                      .collection('schedules')
                      .doc(widget.scheduleData['id'])
                      .update({
                    'batch': newBatch,
                    'Location': newLocation,
                    'date': newDate,
                    'module-code': newModuleCode,
                    'degree': newDegree,
                    'start-time': newStartTime,
                    'end-time': newEndTime,
                  });

                  // Navigate back to the schedule list page after updating
                  Navigator.pop(context);
                },
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
