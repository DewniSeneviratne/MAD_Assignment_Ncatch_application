import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ncatch_nav/rating_submitted_alert.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(178, 214, 255, 1.0),
              Color.fromRGBO(186, 240, 177, 1.0)
            ], // Adjust the colors as needed
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    padding: const EdgeInsets.only(top: 100, left: 30),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'Rate Us',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 34,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(42.0),
                        topRight: Radius.circular(42.0))),
                // height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 0),
                      child: Image.asset(
                        'assets/rating_page_img.png',
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: const Text(
                        'Your opinion matters to us!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 21,
                        ),
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    const SizedBox(
                      height: 15,
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: const Text(
                        'We value your honest feedback and ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          fontSize: 17,
                        ),
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: const Text(
                        'hope to know how would you rate our app?',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: RatingBar.builder(
                        minRating: 1,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color.fromRGBO(122, 190, 183, 1.0),
                        ),
                        onRatingUpdate: (rating) => setState(() {
                          this.rating = rating;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // ignore: avoid_unnecessary_containers
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(0, 193, 84, 1.0),
                        ),
                        onPressed: () => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                          builder: (context) => const AlertBox(),
                        )),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ignore: avoid_unnecessary_containers
            ],
          ),
          // const SizedBox(height: 20),
        ),
      ),
    );
  }
}
