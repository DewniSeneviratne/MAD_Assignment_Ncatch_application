import 'dart:async';


import 'package:flutter/material.dart';
import 'package:ncatch_app/home_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

 @override
void initState() {
  super.initState();
  Timer(Duration(seconds: 6),
  ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),))
  );
  
}

  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage("images/Back01.png"),
            fit: BoxFit.cover,
            

             ),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('images/N Catch.png',
            height: 250.0,
            width: 250.0,
            ),
            CircularProgressIndicator(),
          ],
        )
      
    ),
    );
  }
}