import 'dart:async';

import 'package:crud/colors/colortheme.dart';
import 'package:crud/homepage.dart';
import 'package:crud/logins/logins.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
 getLogin() async {
    bool Loginbool = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Loginbool=prefs.getBool('login')??false;

    Timer(Duration(seconds:2),
            ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Loginbool==true?homePage():loginpage(),)));

  }
  void initState() {
    getLogin();
    //TODO: implement initState
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colortheme.secondarycolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("CRUD",style: TextStyle(
              color: colortheme.primarycolor,
              fontSize: w*0.1,
              fontWeight: FontWeight.w700),)),
        ],
      ),
    );
  }
}
