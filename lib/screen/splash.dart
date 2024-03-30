import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp_pro/screen/in&up.dart';
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash>
    with SingleTickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Timer(Duration(seconds: 3), () {
      //pushReplacement used for no back button
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => inup()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    // TODO: implement dispose
    super.dispose();
  }
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
          children:[
            Image(
                image: AssetImage('images/splash.webp')),
            SizedBox(height: 20,),
            //spin kit
            SpinKitDualRing(
              color: Colors.white,
              size: 40,
            ),
          ],),
      ),
    );
  }
}
