import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/adminHome.dart';
import 'package:intl/intl.dart';

class AdminTt extends StatefulWidget {
  const AdminTt({Key? key}) : super(key: key);

  @override
  State<AdminTt> createState() => _AdminTtState();
}

class _AdminTtState extends State<AdminTt> {
  TextEditingController batchController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController moduleCodeController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();

  String? selectedModuleName;
  String? selectedLocation;
  String? selectedModuleCode;
  String? selectedDegree;
  Timestamp? selectedTimestamp;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dateController.text) {
      // Convert the selected date to a Timestamp
      selectedTimestamp = Timestamp.fromDate(picked);

      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  List<String> moduleNames = []; // This list will store the module names.

  Future<void> fetchModuleNames() async {
    final QuerySnapshot<Map<String, dynamic>> modules =
        await FirebaseFirestore.instance.collection('modules').get();

    setState(() {
      moduleNames =
          modules.docs.map((doc) => doc['module_name'] as String).toList();
    });
  }

  List<String> hallNames = []; // This list will store the hall names.

  Future<void> fetchHallNames() async {
    final QuerySnapshot<Map<String, dynamic>> halls =
        await FirebaseFirestore.instance.collection('halls').get();

    setState(() {
      hallNames = halls.docs.map((doc) => doc['name'] as String).toList();
    });
  }

  List<String> degreeNames = []; // This list will store the degree names.

  Future<void> fetchDegrees(String selectedModuleName) async {
    final QuerySnapshot<Map<String, dynamic>> degrees = await FirebaseFirestore
        .instance
        .collection('modules')
        .where('module_name', isEqualTo: selectedModuleName)
        .get();

    setState(() {
      degreeNames = degrees.docs.map((doc) => doc['degree'] as String).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Schedules Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdminHomePage()),
            );
            // Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter Batch"),
              TextField(
                controller: batchController,
              ),
              const SizedBox(height: 16.0),
              const Text("Select Location"),
              DropdownButtonFormField<String>(
                value:
                    selectedLocation, // Initially selected location (if any).
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation =
                        newValue; // Update the selected location.
                  });
                },
                items:
                    hallNames.map<DropdownMenuItem<String>>((String hallName) {
                  return DropdownMenuItem<String>(
                    value: hallName,
                    child: Text(hallName),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              const Text("Enter Date"),
              TextFormField(
                controller: dateController,
                readOnly: true, // Set the field to be read-only.
                onTap: () {
                  _selectDate(context);
                },
              ),
              const SizedBox(height: 16.0),
              const Text("Select Module"),
              DropdownButtonFormField<String>(
                value:
                    selectedModuleName, // Initially selected module name (if any).
                onChanged: (String? newValue) {
                  setState(() {
                    selectedModuleName = newValue;
                    if (newValue != null) {
                      // Retrieve and set the module code based on the selected module name.
                      FirebaseFirestore.instance
                          .collection('modules')
                          .where('module_name', isEqualTo: newValue)
                          .get()
                          .then((QuerySnapshot<Map<String, dynamic>> degrees) {
                        if (degrees.docs.isNotEmpty) {
                          setState(() {
                            selectedModuleCode =
                                degrees.docs.first['module_code'] as String;
                          });
                        } else {
                          selectedModuleCode = null;
                        }
                      });

                      // Fetch degrees for the selected module name.
                      fetchDegrees(newValue);
                    }
                  });
                },

                items: moduleNames
                    .map<DropdownMenuItem<String>>((String moduleName) {
                  return DropdownMenuItem<String>(
                    value: moduleName,
                    child: Text(moduleName),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              const Text("Select Degree"),
              DropdownButtonFormField<String>(
                value: selectedDegree, // Initially selected degree (if any).
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDegree = newValue; // Update the selected degree.
                  });
                },
                items: degreeNames
                    .map<DropdownMenuItem<String>>((String degreeName) {
                  return DropdownMenuItem<String>(
                    value: degreeName,
                    child: Text(degreeName),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              const Text("Enter Start Time"),
              TextField(
                controller: startTimeController,
              ),
              const SizedBox(height: 16.0),
              const Text("Enter End Time"),
              TextField(
                controller: endTimeController,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  // Retrieve the values from the text fields
                  String batch = batchController.text;
                  String location =
                      selectedLocation ?? ""; // Use selectedLocation
                  String date = dateController.text;
                  String moduleCode =
                      selectedModuleCode ?? ""; // Use selectedModuleCode
                  String degree = selectedDegree ?? ""; // Use selectedDegree
                  String endTime = endTimeController.text;
                  String startTime = startTimeController.text;

                  // Create a new document in the "Schedules" collection
                  await FirebaseFirestore.instance.collection('schedules').add({
                    'batch': batch,
                    'Location': location,
                    'date': FieldValue.serverTimestamp(),
                    'module-code': moduleCode,
                    'degree': degree,
                    'end-time': endTime,
                    'start-time': startTime,
                  });

                  // Reset the text fields and selections
                  batchController.clear();
                  locationController.clear();
                  dateController.clear();
                  moduleCodeController.clear();
                  degreeController.clear();
                  endTimeController.clear();
                  startTimeController.clear();
                  setState(() {
                    selectedModuleName = null;
                    selectedLocation = null;
                    selectedModuleCode = null;
                    selectedDegree = null;
                  });

                  // Optional: Show a success message or navigate to another screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Schedule added successfully')),
                  );
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchModuleNames();
    fetchHallNames();
  }
}
