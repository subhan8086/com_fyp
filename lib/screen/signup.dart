import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fyp_pro/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_pro/screen/login.dart';
import 'package:fyp_pro/utils.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  double width = 460.0; // You should define the width variable
  bool _obscureText = true;
  bool _obscureText1 = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 360,
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeInDown(
                      duration: Duration(seconds: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/bk.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeInDown(
                      duration: Duration(seconds: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/bk2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    duration: Duration(seconds: 4),
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FadeInUp(
                    duration: Duration(seconds: 4),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(196, 135, 198, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[200]!,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }



                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            /////////PASSWORD/////////////////I/////////////////////////////////////////////////////////////////////////////////////
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: _obscureText,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (!RegExp(
                                      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
                                      .hasMatch(value)) {
                                    return 'Password must be at least 8 characters long and include at least one letter, one digit, and one special character.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        // Toggle the visibility state of the password
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });}),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),

                            ),
                            /////confrm password///////////////////////////////////////////////////////////////////
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: _obscureText1,
                                controller: _confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText1 ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        // Toggle the visibility state of the password
                                        setState(() {
                                          _obscureText1 = !_obscureText1;
                                        });}),
                                  border: InputBorder.none,
                                  hintText: " confirm Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),


                    ),
                  ),
                  ///////////////////////////////practice text filed
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     obscureText: _obscureText1,
                  //     controller: _confirmPasswordController,
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Please enter your password';
                  //       }
                  //       if (value != _passwordController.text) {
                  //         return 'Passwords do not match';
                  //       }
                  //       return null;
                  //     },
                  //     decoration: InputDecoration(
                  //       suffixIcon: IconButton(
                  //           icon: Icon(
                  //             _obscureText1 ? Icons.visibility : Icons.visibility_off,
                  //             color: Colors.grey,
                  //           ),
                  //           onPressed: () {
                  //             // Toggle the visibility state of the password
                  //             setState(() {
                  //               _obscureText1 = !_obscureText1;
                  //             });}),
                  //       border: InputBorder.none,
                  //       hintText: " confirm Password",
                  //       hintStyle: TextStyle(color: Colors.grey),
                  //     ),
                  //   ),
                  //
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 90,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 130),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.purple,
                    ),
                    child: FadeInUp(
                      duration: Duration(seconds: 4),
                      child: Center(
                        child: InkWell(
                          //firebase
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await _auth.createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => home(), // Change this line to navigate to the home screen
                                  ),
                                );
                              } catch (error) {
                                utils().toastMessage(error.toString());
                              }
                            }
                          },

                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                // NEW //BUTTON/////////////////////////////////////////////////////
                 // InkWell(onTap:(){Navigator.push(context,
                 //     MaterialPageRoute(builder: (context)=>login())); },
                 // child: Text('Log In'),)
// Container(
//   margin: EdgeInsets.symmetric(horizontal: 130),
//   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
//     color: Colors.cyan,),
//
//   child: InkWell(
//     onTap: (){
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
//     },
//     child: Text('subhan',style: TextStyle(color: Colors.red),),
//
//   ),
//)
                ],
              ),
            ),

          ],

        ),
      ),
    );
  }
}
