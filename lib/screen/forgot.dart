import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_pro/screen/home.dart';
import 'package:fyp_pro/screen/login.dart';
import 'package:fyp_pro/utils.dart';


class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  final emailcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
          },
        ),
        title:
    Center(child: Text("Forgot Password ",
      style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),)),

    ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center
        ,
        children: [
          Image(
              height: 50,
              width: 45,
              image: AssetImage('images/forgot.png')
          ),

          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
                     controller: emailcontroller,
              decoration: InputDecoration(

                  hintText: "Enter E_mail",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),

                  )),

            ),
          ),
         

          SizedBox(height: 50,),
          Container(
            height: 40,
            width: 115,
            decoration: BoxDecoration(

                 borderRadius: BorderRadius.circular(50),
                // boxShadow: [
                //   BoxShadow(color: Colors.pink.withOpacity(0.5),
                //
                //   )
                // ]
            ),
            child: ElevatedButton(
              onPressed: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                _auth.sendPasswordResetEmail(
                    email: emailcontroller.text.toString())
                    .then((value)  {
                      utils().toastMessage('We have sent email to recover  Password Please Check email  ');
                }).onError((error, stackTrace) {
                  utils().toastMessage(error.toString());
                } );
            },
                style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  "Sent",
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