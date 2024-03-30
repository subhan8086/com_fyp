import 'package:flutter/material.dart';
import 'package:fyp_pro/screen/home.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
          },
        ),
      title: Center(child: Text('Profile',
        style: TextStyle(color: Colors.white),)),
    ),);
  }
}
