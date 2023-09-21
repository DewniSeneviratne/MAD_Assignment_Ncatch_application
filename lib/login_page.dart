import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/forgot-password.dart';
import 'package:flutter_application_9/home.dart';
import 'package:flutter_application_9/signup.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _performSignIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || !isValidEmail(email)) {
      _showErrorDialog("Invalid Email");
    } else if (password.isEmpty) {
      _showErrorDialog("Password cannot be empty");
    } else {
      try {
        // Sign in with email and password using Firebase Authentication
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // If sign-in is successful, userCredential.user will contain user information
        User? user = userCredential.user;

        if (user != null) {
          // Navigate to the home screen after successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          );
        }
      } catch (error) {
        // Handle sign-in errors here
        print('Login error: $error');
        _showErrorDialog("Invalid credentials. Please try again.");
      }
    }
  }

  bool isValidEmail(String email) {
    return email.contains('@');
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFB2D6FF),
              Color(0xFFC7E8FF),
              Color(0xFFC0ECD7),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(),
                  SizedBox(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'N',
                          style: TextStyle(
                            fontSize: 64,
                            color: HexColor('00C254'),
                            fontFamily: 'Omagle',
                          ),
                        ),
                        const Text(
                          'catch',
                          style: TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                            fontFamily: 'Omagle',
                          ),
                        ),
                      ],
                    ),
                  ),
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 270,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: HexColor('#0A1E36'),
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: HexColor('0A1E36'),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 160,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Fpassword(),
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Forgot password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: HexColor('0A1E36'),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _performSignIn();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 130),
                        backgroundColor: HexColor('00C154'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t you have an account? ',
                          style: TextStyle(
                            color: HexColor('0A1E36'),
                            fontFamily: 'Poppins',
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: HexColor('0A1E36'),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/lp.png',
                    width: double.infinity, // Set the width to fill the screen
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
