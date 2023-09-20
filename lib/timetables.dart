import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/custom-nav.dart';
import 'package:flutter_application_9/firebase_options.dart';
import 'package:flutter_application_9/home.dart';
import 'package:intl/intl.dart';

import 'schedules.dart'; // Import the Schedule class
import 'user.dart'; // Import the User class

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final User currentUser =
      User(batch: "21.1", degree: "Management Information Systems");

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LecturesScreen(currentUser: currentUser),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LecturesScreen extends StatefulWidget {
  final User currentUser;

  const LecturesScreen({super.key, required this.currentUser});

  @override
  _LecturesScreenState createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  final PageController _pageController = PageController();
  DateTime selectedDate = DateTime.now();
  int selectedDayIndex = DateTime.now().weekday;
  int selectedTabIndex = 0;
  String hh = "AM";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFB2D6FF),
            Color(0xFFC7E8FF),
            Color(0xFFB0F57F),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tt-background.png'),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.33,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Timetables",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 34,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFF0A1E36),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          // Handle button press here
                                        },
                                        icon: Image.asset(
                                            "assets/View Schedule.png"),
                                        iconSize: 34,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFF00C154),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset("assets/Planner.png"),
                                        iconSize: 34,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFF00C154),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          // Handle button press here
                                        },
                                        icon:
                                            Image.asset("assets/lecturer.png"),
                                        iconSize: 34,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(42.0),
                  topRight: Radius.circular(42.0),
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 1; i <= 7; i++)
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedDate = DateTime.now().subtract(
                                        Duration(
                                            days: DateTime.now().weekday - i));
                                    selectedDayIndex = i;
                                  });
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return const Color(0xFF00C154);
                                      } else if (i == selectedDayIndex) {
                                        return const Color(0xFF00C154);
                                      }
                                      return const Color(0xFFC6E6FF);
                                    },
                                  ),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.blue.withOpacity(0.5)),
                                ),
                                child: Center(
                                  child: Text(
                                    _getDayOfWeek(i),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF0A1E36),
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w600,
                                      height: 2.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.4,

                            padding: const EdgeInsets.only(
                                right: 8.0), // Add padding for spacing
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Create a row for each time slot

                                for (int hour = 9; hour <= 16; hour++)

                                  // Loop from 9 to 16 (4 PM)
                                  Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black, // Border color
                                          spreadRadius: -3, // Spread radius
                                          blurRadius: 5, // Blur radius
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.37,
                                          padding: const EdgeInsets.all(8.0),
                                          color: Colors.white,
                                          child: Text(
                                            '${(hour)}.00 - ${_formatHour(hour + 1)}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "poppins",
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Expanded(
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('schedules')
                                    .where('batch',
                                        isEqualTo: widget.currentUser.batch)
                                    .where('degree',
                                        isEqualTo: widget.currentUser.degree)
                                    .orderBy('date')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (!snapshot.hasData ||
                                      snapshot.data!.docs.isEmpty) {
                                    return const Center(
                                      child: Text('No lectures for this day.'),
                                    );
                                  } else {
                                    final lectures = snapshot.data!.docs
                                        .map((doc) => Schedule(
                                              location: doc['Location'],
                                              batch: doc['batch'],
                                              degree: doc['degree'],
                                              date: doc['date'] as Timestamp,
                                              endTime: doc['end-time'],
                                              moduleCode: doc['module-code'],
                                              startTime: doc['start-time'],
                                            ))
                                        .where((lecture) => _isSameDay(
                                            lecture.date.toDate(),
                                            selectedDate))
                                        .toList();

                                    if (lectures.isEmpty) {
                                      return const Center(
                                        child:
                                            Text('No lectures for this day.'),
                                      );
                                    }

                                    return SingleChildScrollView(
                                      child: Column(
                                        children: lectures.map((lecture) {
                                          return _buildLectureTile(lecture);
                                        }).toList(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavBar(
          currentIndex: selectedTabIndex, // Pass the selectedTabIndex here
          onTap: (index) {
            setState(() {
              selectedTabIndex = index; // Update the selectedTabIndex
            });
            _navigateToPage(index);
            // Call a function to navigate based on index
          },
          pageController: _pageController,
        ),
      ),
    );
  }

  String _getDayOfWeek(int day) {
    final today = DateTime.now();
    final daysUntilSelectedDay = day - today.weekday;
    final selectedDay = today.add(Duration(days: daysUntilSelectedDay));

    final formatter = DateFormat('MMM d, E');
    return formatter.format(selectedDay);
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget _buildLectureTile(Schedule lecture) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFB2D6FF),
            Color(0xFFC7E8FF),
            Color(0xFFB0F57F),
          ],
        ),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: _fetchModuleName(lecture), // Fetch module name
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text(
                    'Module Name: Loading...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0A1E36),
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                    'Module Name: Error',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0A1E36),
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  );
                } else {
                  return Text(
                    snapshot.data ?? "N/A",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0A1E36),
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  );
                }
              },
            ),
            Text(
              ' ${lecture.startTime} to ${lecture.endTime}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: "poppins",
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: _fetchLecturerName(lecture),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text(
                    'Lecturer: Loading...',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: "poppins",
                    ),
                    textAlign: TextAlign.center,
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                    'Lecturer: Error',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: "poppins",
                    ),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Text(
                    snapshot.data ?? "N/A",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: "poppins",
                    ),
                    textAlign: TextAlign.center,
                  );
                }
              },
            ),
            if (lecture.location.isNotEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: const Color(0xFF00C154),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Location.png',
                        height: MediaQuery.of(context).size.height * 0.027,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        lecture.location,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<String?> _fetchLecturerName(Schedule lecture) async {
    final moduleQuery = await FirebaseFirestore.instance
        .collection('modules')
        .where('module_code', isEqualTo: lecture.moduleCode)
        .get();

    if (moduleQuery.docs.isNotEmpty) {
      final lecturerName = moduleQuery.docs.first['Lecturer'];
      return lecturerName;
    } else {
      return null;
    }
  }

  Future<String?> _fetchModuleName(Schedule lecture) async {
    final moduleQuery = await FirebaseFirestore.instance
        .collection('modules')
        .where('module_code', isEqualTo: lecture.moduleCode)
        .get();

    if (moduleQuery.docs.isNotEmpty) {
      final moduleName = moduleQuery.docs.first['module_name'];
      return moduleName;
    } else {
      return null;
    }
  }

  void _navigateToPage(int index) {
        final User currentUser =
        User(batch: "21.1", degree: "Management Information Systems");
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()),
        );
        break;
      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LecturesScreen(currentUser: currentUser)),
        );
        break;
      // Add more cases for other pages if needed
    }
  }

  String _formatHour(int hour) {
    if (hour < 12) {
      return '$hour:00 AM';
    } else if (hour == 12) {
      return '12:00 PM';
    } else {
      return '${hour - 12}:00 PM';
    }
  }
}
