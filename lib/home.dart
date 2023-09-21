import 'package:flutter/material.dart';
import 'package:flutter_application_9/custom-nav.dart';
import 'package:flutter_application_9/hope.dart';
import 'package:flutter_application_9/navigation_drawer.dart';
import 'package:flutter_application_9/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final User currentUser =
      User(batch: "21.1", degree: "Management Information Systems");
  int selectedTabIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFB2D6FF),
            Color(0xFFC7E8FF), // Hex color #B2D6FF
            Color(0xFFB0F57F), // Hex color #9EFF18
          ],
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 50.0,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu), // You can use any icon you prefer
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: const MyNavigationDrawer(),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/homeBack.png'),
                    alignment: Alignment.bottomRight,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: const Row(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "N",
                                  style: TextStyle(
                                      fontFamily: "Omagle",
                                      fontSize: 56,
                                      color: Color(0xFF00C154)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "catch",
                                  style: TextStyle(
                                    fontFamily: "Omagle",
                                    fontSize: 56,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Discover",
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "the world at",
                            style: TextStyle(
                              fontSize: 29,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "your fingertips",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 19,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.48,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42.0), //
                    topRight: Radius.circular(42.0),
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.44,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                  (MediaQuery.of(context).size.height * 0.16) *
                                      0.1),
                              height: MediaQuery.of(context).size.height * 0.16,
                              width: MediaQuery.of(context).size.width * 0.48,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 205, 233, 255),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Model papers for",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const Text(
                                    "Advanced",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Text(
                                    "mathematics",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        (MediaQuery.of(context).size.height *
                                                0.16) *
                                            0.23,
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        onPressed: null,
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color(0xFF00C154)),
                                        ),
                                        child: const Text(
                                          "Explore Now",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                  (MediaQuery.of(context).size.height * 0.16) *
                                      0.1),
                              height: MediaQuery.of(context).size.height * 0.16,
                              width: MediaQuery.of(context).size.width * 0.34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFcdebf6),
                                    Color(0xFFD4FBCF),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height:
                                          (MediaQuery.of(context).size.height *
                                                  0.16) *
                                              0.23,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LecturesScreen(
                                                      currentUser: currentUser),
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color(0xFF00C154)),
                                        ),
                                        child: const Text(
                                          "MAD Lec 6",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "TODAY",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const Text(
                                    "9.00 B1 101",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const Text(
                                    "Mr. Dilan Perera",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              (MediaQuery.of(context).size.height * 0.16) *
                                  0.1),
                          height: MediaQuery.of(context).size.height * 0.185,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFFCDEBF6),
                                  Color(0xFFD4FBCF),
                                ]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Let's go green",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text(
                                "Webinar conducted by The International",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const Text(
                                "Center for Innovation & Invention",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height:
                                        (MediaQuery.of(context).size.height *
                                                0.16) *
                                            0.23,
                                    child: ElevatedButton(
                                      onPressed: null,
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xFF00C154)),
                                      ),
                                      child: const Text(
                                        "Going?",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: const Row(
                                      children: [
                                        Text("Yes"),
                                        Icon(
                                          Icons.task_alt_rounded,
                                          color: Color(0xFF00C154),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "July 18 05.30 PM",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/Group 19111.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.047,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "assets/Group 19112.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.047,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          MaterialPageRoute(
              builder: (context) => LecturesScreen(currentUser: currentUser)),
        );
        break;
      // Add more cases for other pages if needed
    }
  }

  void _openDrawer() {
    Scaffold.of(context).openDrawer();
  }
}
