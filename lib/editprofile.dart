import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Stack(
          children: [
            AppBar(
              backgroundColor: Colors.pink,
              elevation: 0.0,
              title: const Text("Hi Zara"),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 160.0, // Adjust the top position as needed
              right: 10.0, // Adjust the right position as needed
              child: ClipOval(
                child: Image.asset(
                  'assets/propic.jpg',
                  width: 60, // Adjust the size as needed
                  height: 60, // Adjust the size as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        // Your main content goes here
        color: Colors.white, // Set the background color of the body
      ),
    );
  }
}
