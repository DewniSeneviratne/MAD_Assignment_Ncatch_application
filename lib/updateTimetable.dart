import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/adminHome.dart';
import 'package:flutter_application_9/editTimetableFields.dart';
import 'package:intl/intl.dart';

class UpdateSchedulePage extends StatefulWidget {
  const UpdateSchedulePage({super.key});

  @override
  _UpdateSchedulePageState createState() => _UpdateSchedulePageState();
}

class _UpdateSchedulePageState extends State<UpdateSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C154),
        title: const Text("Update Schedules"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Use the back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AdminHomePage()),
            );
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('schedules').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          final List<QueryDocumentSnapshot> schedules = snapshot.data!.docs;

          return ListView.builder(
            itemCount: schedules.length,
            itemBuilder: (context, index) {
              final schedule = schedules[index].data() as Map<String, dynamic>;
              final documentId = schedules[index].id;

              // Create a ListTile for each schedule with all fields
              return Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0), // Add margin for spacing
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), // Add border radius
                  border: Border.all(color: Colors.grey), // Add border color
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 158, 244, 164)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ], // Add box shadow for embossed effect
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      const Text(
                        "Batch: ",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "${schedule['batch']}",
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.002,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Location: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${schedule['Location']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.002,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Date: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd')
                                .format(schedule['date'].toDate()),
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.002,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Module Code: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${schedule['module-code']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.002,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Degree: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${schedule['degree']}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300,
                              ),
                              maxLines:
                                  1, // Adjust the maximum number of lines before text overflows.
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.002,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Start Time: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${schedule['start-time']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.002,
                      ),
                      Row(
                        children: [
                          const Text(
                            "End Time: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${schedule['end-time']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(
                              0xFF00C154)), // Change to your desired color
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditSchedulePage(
                                scheduleData: {...schedule, 'id': documentId})),
                      );
                    },
                    child: const Text("Update"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
