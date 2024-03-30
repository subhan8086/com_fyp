import 'package:flutter/material.dart';
import 'package:fyp_pro/screen/login.dart';
import 'package:fyp_pro/screen/signup.dart';
import 'package:google_fonts/google_fonts.dart';
class inup extends StatefulWidget {
  const inup({super.key});

  @override
  State<inup> createState() => _inupState();
}

class _inupState extends State<inup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue,Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('        Welcome to    \nGlobal News Channel',
                style:
                GoogleFonts.actor(
                    letterSpacing: .6, color: Colors.white,fontSize: 30,
                    fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
            SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () {
            // Button action goes here
            Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple, // Background color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ), child: Text('LogIn',style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold)),

        ) ,
          SizedBox(height: 20,),
            ///signup button //strat
            ElevatedButton(
              onPressed: () {
                // Button action goes here
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
              },
              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.purple, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ), child: Text('SignUp',style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold),),

            ),
            SizedBox(height: 30,),

            //


          ],),

    ));
  }
}
