import 'package:flutter/material.dart';
import 'package:flutter_application_9/addTt.dart';
import 'package:flutter_application_9/updateTimetable.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C154),
        title: const Text("Admin Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminTt(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C154),
                padding:
                    const EdgeInsets.all(20.0), // Adjust the button padding
                minimumSize: const Size(300.0, 100.0), // Set button size
              ),
              child: const Text(
                "Add Time Tables",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 20.0), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdateSchedulePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.all(20.0), // Adjust the button padding
                  minimumSize: const Size(300.0, 100.0),
                  backgroundColor: const Color(0xFF00C154)),
              child: const Text(
                "View and Edit",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
