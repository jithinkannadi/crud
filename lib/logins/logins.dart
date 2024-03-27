import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/homepage.dart';
import 'package:crud/logins/login_login.dart';
import 'package:crud/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colortheme.primarycolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colortheme.primarycolor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: w*0.7,
            width: w*1,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagepicture.crud),fit: BoxFit.fill)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("CRUD",style: TextStyle(
                  color: colortheme.secondarycolor,
                  fontSize: w*0.1,
                  fontWeight: FontWeight.w700),),
              Text("Create, Read, Update ,Delete",style: TextStyle(
                color: colortheme.secondarycolor,
                fontWeight: FontWeight.w400
              ),),

            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                 setState(() {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => loginpagenew(),));

                 });
                },
                child: Container(
                  height: w*0.13,
                  width: w*0.6,
                  decoration: BoxDecoration(color: colortheme.secondarycolor,
                  borderRadius: BorderRadius.circular(w*0.07),
                  ),
                  child: Center(
                    child: Text("Login",style: TextStyle(
                        color: colortheme.primarycolor,
                        fontSize: w*0.05,
                        fontWeight: FontWeight.w700),),
                  ),
                ),
              ),
              SizedBox(height: w*0.06),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));

                  });
                },
                child: Container(
                  height: w*0.13,
                  width: w*0.6,
                  decoration: BoxDecoration(color: colortheme.primarycolor,
                  borderRadius: BorderRadius.circular(w*0.07),
                    border: Border.all(color:colortheme.secondarycolor,width: w*0.006)

                  ),
                  child: Center(
                    child: Text("Sign up",style: TextStyle(
                        color: colortheme.secondarycolor,
                        fontSize: w*0.05,
                        fontWeight: FontWeight.w700),),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
