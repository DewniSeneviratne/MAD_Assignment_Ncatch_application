import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/home.dart';
import 'package:flutter_application_9/login.dart';
import 'package:hexcolor/hexcolor.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isPasswordVisible = false;
  bool _isConPassword = false;
  bool isChecked = false;
  List<String> batchList = [];
  List<String> degreeList = [];
  String selectedBatch = '';
  String selectedDegree = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _batchController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPaswordController = TextEditingController();

  // Function to handle user registration
  Future<void> _registerUser() async {
    try {
      // Get user input values
      String email = _emailController.text;
      String degree = selectedDegree;
      String batch = selectedBatch;
      String password = _passwordController.text;
      String conPassword = _conPaswordController.text;

      if (email.isNotEmpty &&
          degree.isNotEmpty &&
          batch.isNotEmpty &&
          password.isNotEmpty &&
          password == conPassword) {
        // Create the user account using Firebase Authentication
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Retrieve the current user
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // Create a Firestore document to store additional user data
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'email': email,
            'degree': degree,
            'batch': batch,
            // Add other user data fields as needed.
          });

          // Redirect to another page or show a success message
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        }
      } else {
        // Handle input validation or show an error message
        // For example, you can display a SnackBar or AlertDialog.
        print('Please fill in all fields.');
      }
    } catch (error) {
      // Handle any registration errors here
      print('Registration error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB4D5E0),
              Color(0xFFC7E8FF),
              Color(0xFFBAF0B1),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'N',
                            style: TextStyle(
                              fontSize: 64,
                              color: HexColor('00C254'),
                              fontFamily: 'Omagle',
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'catch',
                            style: TextStyle(
                              fontSize: 64,
                              color: Colors.white,
                              fontFamily: 'Omagle',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 270,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: HexColor('0A1E36'),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 270,
                        child: Text(
                          'Batch',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: HexColor('0A1E36'),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 300,
                        child: DropdownButtonFormField<String>(
                          value: selectedBatch,
                          onChanged: (newValue) {
                            setState(() {
                              selectedBatch = newValue!;
                            });
                          },
                          items: batchList.map((batch) {
                            return DropdownMenuItem(
                              value: batch,
                              child: Text(batch),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 270,
                        child: Text(
                          'Degree',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: HexColor('0A1E36'),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 300,
                        child: DropdownButtonFormField<String>(
                          value: selectedDegree,
                          onChanged: (newValue) {
                            setState(() {
                              selectedDegree = newValue!;
                            });
                          },
                          items: degreeList.map((degree) {
                            return DropdownMenuItem(
                              value: degree,
                              child: Text(degree),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 270,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: HexColor('0A1E36'),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 270,
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: HexColor('0A1E36'),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _conPaswordController,
                          obscureText: !_isConPassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConPassword = !_isConPassword;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (newValue) {
                                  setState(() {
                                    isChecked = newValue!;
                                  });
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Home(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Agree to Terms and Conditions',
                                  style: TextStyle(
                                    color: HexColor('0A1E36'),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: isChecked
                            ? () {
                                _registerUser();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 100),
                          backgroundColor: HexColor('00C154'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        'Sign Up as an Admin',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: HexColor('0A1E36'),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchBatchValues();
  }

  Future<void> _fetchBatchValues() async {
    try {
      QuerySnapshot batchSnapshot =
          await FirebaseFirestore.instance.collection('degrees').get();

      List<String> batches = [];
      Map<String, List<String>> batchDegreeMap = {};

      for (QueryDocumentSnapshot doc in batchSnapshot.docs) {
        String batch = doc.get('batch');
        String degree = doc.get('degree-name');

        if (!batches.contains(batch)) {
          batches.add(batch);
          // Check if the list is null and initialize it if necessary
          if (batchDegreeMap[batch] == null) {
            batchDegreeMap[batch] = [degree];
          } else {
            batchDegreeMap[batch]!.add(degree);
          }
        } else {
          // Check if the list is null and initialize it if necessary
          if (batchDegreeMap[batch] == null) {
            batchDegreeMap[batch] = [degree];
          } else {
            batchDegreeMap[batch]!.add(degree);
          }
        }
      }

      setState(() {
        batchList = batches;
        // Set the selectedBatch to the first batch in the list initially
        if (batches.isNotEmpty) {
          selectedBatch = batches[0];
        }
        if (selectedBatch.isNotEmpty) {
          degreeList = batchDegreeMap[selectedBatch] ?? [];
          // Set the selectedDegree to the first degree in the list initially
          if (degreeList.isNotEmpty) {
            selectedDegree = degreeList[0];
          }
        }
      });
    } catch (error) {
      print('Error fetching batch values: $error');
    }
  }
}
