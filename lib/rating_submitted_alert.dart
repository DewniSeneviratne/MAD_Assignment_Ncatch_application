import 'package:flutter/material.dart';
import 'package:ncatch_nav/temp_home_page.dart';

class AlertBox extends StatelessWidget {
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
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
      child: AlertDialog(
        title: const Text('Rate Us'),
        content: const Text('Your rating was submitted succesfully.'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const TempHomePage(),
            )),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
