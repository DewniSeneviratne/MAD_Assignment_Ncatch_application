import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final PageController pageController; // Add this parameter

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.pageController, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor:
          const Color(0xFF252323), // Change the background color as needed
      selectedFontSize: 14,
      unselectedFontSize: 12,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color.fromARGB(255, 85, 84, 84),
      //iconSize: 30,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/Homeq.png',
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/Timetable.png',
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          label: 'Timetables',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/Test Passed.png',
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          label: 'Paper Bank',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/Shop.png',
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          label: 'Notify',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/Paper.png',
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          label: 'Profile',
        ),
      ],
      onTap: onTap,
    );
  }
}
