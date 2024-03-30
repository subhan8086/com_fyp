import 'package:flutter/material.dart';
import 'package:fyp_pro/screen/home.dart';
class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.purple,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
        },
      ),
      title: Center(child: Text('Add Post',
        style: TextStyle(color: Colors.white),)),

    ),
    body: Column(children: [
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
maxLines: 4,
          decoration: InputDecoration(
              hintText: "Write Here!",
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),

              ),


          ),
        ),
      ),

      SizedBox(height: 30,),
      Container(
        height: 40,
        width: 115,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(color: Colors.pink.withOpacity(0.5),

              )
            ]
        ),
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
        },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(
            "Add",
            style:TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Colors.white,

              fontWeight: FontWeight.bold,


            ),


          ),

        ),
      )

    ],),
    );
  }
}
