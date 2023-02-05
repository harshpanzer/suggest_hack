import 'package:flutter/material.dart';
import 'package:suggest/Animation/FadeAnimation.dart';
import 'package:suggest/homepage.dart';
import 'package:suggest/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suggest/user_data.dart';

class UserSignIn extends StatefulWidget {
  UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final signUpKey = GlobalKey<FormState>();

  @override
  final email = TextEditingController();
  final pass = TextEditingController();
  final usernametextconroller = TextEditingController();
  final budget = TextEditingController();
  final age = TextEditingController();

  Widget build(BuildContext context) {
    double scheight = MediaQuery.of(context).size.height;
    double scwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/images/bg1.jpeg"),
            //         fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/background.png"),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/light-1.png"))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 100,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/light-2.png"))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 100,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/clock.png"))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: signUpKey,
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.8,
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: TextFormField(
                                      controller: email,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email or Phone number",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Your Name';
                                        } else if (!RegExp(
                                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                            .hasMatch(value)) {
                                          return 'Enter Valid Name';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color.fromRGBO(
                                                    158, 158, 158, 1)))),
                                    child: TextFormField(
                                      controller: pass,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter a Password';
                                          // } else if (!RegExp(
                                          //         r'^(?=(.*[a-z]){3,})(?=(.*[A-Z]){2,})(?=(.*[0-9]){2,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}$')
                                          //     .hasMatch(value)) {
                                          //   return 'Enter Valid Password';
                                        } else if (value.length < 8) {
                                          return 'Enter a Password containing more than 8 characters';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: TextFormField(
                                      controller: usernametextconroller,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Your Name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: TextFormField(
                                      controller: budget,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Budget",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Your Budget';
                                        } else if (!RegExp(r'^[0-9]+$')
                                            .hasMatch(value)) {
                                          return 'Enter A Valid Amount';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: age,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Age",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Your Age';
                                        } else if (!RegExp(r'^[0-9]+$')
                                            .hasMatch(value)) {
                                          return 'Enter A Valid Age';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            2,
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    final isValid =
                                        signUpKey.currentState!.validate();
                                    if (!isValid) return;
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: email.text.trim(),
                                            password: pass.text.trim())
                                        .then((value) {
                                      postDetailsToFirestore();
                                      print('Created New Account');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  Homepage())));
                                    }).onError((error, stackTrace) {
                                      print("\nError ${error.toString()}");
                                    });
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Row(children: <Widget>[
                          // FadeAnimation(
                          //     1.5,
                          //     Text(
                          //       "Forgot Password?",
                          //       style: TextStyle(
                          //           color: Color.fromRGBO(143, 148, 251, 1)),
                          //     )),
                          SizedBox(
                            width: scwidth * 0.3,
                          ),
                          FadeAnimation(
                              1.5,
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "Existing User?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1)),
                                ),
                              )),
                        ])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = usernametextconroller.text.trim();
    userModel.age = age.text.trim();
    userModel.budget = budget.text.trim();
    print("data taken");

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }
}
