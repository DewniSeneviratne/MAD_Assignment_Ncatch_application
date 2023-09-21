import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool showPw = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Stack(
      //   children: <Widget>[
      //     ClipOval(
      //       child: Image.asset(
      //         'assets/propic.jpg', // Replace with your image URL
      //         width: 100, // Adjust the width and height as needed
      //         height: 100,
      //         fit: BoxFit
      //             .cover, // You can use different BoxFit values depending on how you want to fit the image
      //       ),
      //     ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB2D6FF),
              Color(0xFFC7E8FF),
              Color(0xFFB9F0AF),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 30.0,
                    ),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          Text(
                            "Hi Zara",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ), // Add some spacing
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42),
                    topRight: Radius.circular(42),
                  ),
                ),
                child: GestureDetector(
                  //provides a gesture recognition framework
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "edit profile",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.transparent,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/propic.jpg', // Replace with your image URL
                                width:
                                    100, // Adjust the width and height as needed
                                height: 100,
                                fit: BoxFit
                                    .cover, // You can use different BoxFit values depending on how you want to fit the image
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 15.0,
                      ),

                      //SizedBox is to add spacing (vertical space) between the "edit profile"
                      Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 7,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0.10, 0.1))
                                ],
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/propic.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      textFieldMethod("Name", "Harindi", false),
                      textFieldMethod(
                          "Email", "eranthikah999@gmail.com", false),
                      textFieldMethod("Password", "AAAAAAAAA", true),
                      textFieldMethod("Location", "Colombo", false),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 49),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 49),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "SAVE",
                                style: TextStyle(
                                    fontSize: 11,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldMethod(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPw : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPw = !showPw;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
