import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/otp.dart';
import 'package:crud/phone.dart';
import 'package:crud/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homepage.dart';
import '../main.dart';

class loginpagenew extends StatefulWidget {
  const loginpagenew({super.key});

  @override
  State<loginpagenew> createState() => _loginpagenewState();
}

class _loginpagenewState extends State<loginpagenew> {
  bool pass=false;

  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  final usernameValidation=RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // final formKey=GlobalKey<FormState>();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colortheme.primarycolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colortheme.primarycolor ,
        title: Text("CRUD",style: TextStyle(
            color: colortheme.thirdcolor,
            fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: w*0.7,
              width: w*1,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagepicture.login),fit: BoxFit.fill)),
            ),
            Padding(
              padding: EdgeInsets.all(w*0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                     controller: usernameController,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   if(!usernameValidation.hasMatch(value!))
                    //   {
                    //     return "Enter Valid Username";
                    //   }
                    //   else{
                    //     return null;
                    //   }
                    // },
                    style: TextStyle(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.04),
                          borderSide: BorderSide(color: colortheme.secondarycolor)
                      ),
                      fillColor: colortheme.primarycolor,
                      filled: true,

                      labelText: "Username",labelStyle: TextStyle(
                        color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                    ),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(w*0.04),
                        borderSide: BorderSide(color: colortheme.secondarycolor)
                      )
                    ),
                  ),
                  SizedBox(height: w*0.04),
                  TextFormField(
                    controller: passwordController,
                    //  autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   if(!passwordValidation.hasMatch(value!))
                    //   {
                    //     return "Enter Valid Password";
                    //   }
                    //   else{
                    //     return null;
                    //   }
                    // },
                    style: TextStyle(),
                    obscureText: pass==true?false:true,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding:  EdgeInsets.all(w*0.03),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              pass=!pass;
                            });
                          },
                            child: SvgPicture.asset(pass?imagepicture.eye:imagepicture.eye_off)),
                      ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.04),
                            borderSide: BorderSide(color: colortheme.secondarycolor)
                        ),
                        fillColor: colortheme.primarycolor,
                        filled: true,
                        labelText: "Password",labelStyle: TextStyle(
                        color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                    ),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(w*0.04),
                            borderSide: BorderSide(color: colortheme.secondarycolor)
                        )
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));
                    //  setState(() {
                    //    if(
                    //    usernameController.text!=""&&
                    //        passwordController.text!=""&&
                    //        formKey.currentState!.validate()
                    //    ){
                    //      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));
                    //      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Sucessfully")));
                    //    }
                    //    else
                    //    {
                    //      usernameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your username"))):
                    //      passwordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your password"))):
                    //      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Valid Details")));
                    //    }
                    //  }
                    //  );

                     await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email:usernameController.text.trim(),
                        password: passwordController.text.trim())
                         .then((value) async {

                         var namedata=await FirebaseFirestore.instance.collection("SigUsers").where(
                         "email",isEqualTo:usernameController.text.trim()).get();
                         username=namedata.docs[0]["name"];

                         SharedPreferences prefs = await SharedPreferences.getInstance();
                         prefs.setString("username", username.toString());


                         Navigator.push(context, MaterialPageRoute(builder: (context) =>homePage(),));
                        },).catchError((error){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: w*0.08,
                              width: w*0.1,
                              child: SvgPicture.asset(imagepicture.lock)),
                          Container(
                            height: w*0.1,
                            width: w*0.4,
                            child: Center(
                              child: Text("Login",textAlign: TextAlign.center,style: TextStyle(

                                  color: colortheme.secondarycolor,
                                  fontSize: w*0.05,
                                  fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: w*0.03),
                InkWell(
                  onTap: () {
                    signInWithGoogle().then((value) => Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => homePage(),), (route) => false));
                  },
                  child: Container(
                    height: w*0.13,
                    width: w*0.6,
                    decoration: BoxDecoration(color: colortheme.primarycolor,
                        borderRadius: BorderRadius.circular(w*0.07),
                        border: Border.all(color:colortheme.secondarycolor,width: w*0.006)

                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(imagepicture.google),
                          Text("Sign in with Google",style: TextStyle(
                              color: colortheme.secondarycolor,
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w700),),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: w*0.03),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => phonepage(),));

                    });
                  },
                  child: Container(
                    height: w*0.13,
                    width: w*0.6,
                    decoration: BoxDecoration(color: colortheme.primarycolor,
                        borderRadius: BorderRadius.circular(w*0.07),
                        border: Border.all(color:colortheme.secondarycolor,width: w*0.006)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: w*0.08,
                            width: w*0.05,
                            child: SvgPicture.asset(imagepicture.phone)),
                        Container(
                          height: w*0.1,
                          width: w*0.35,
                          child: Center(
                            child: Text("OTP sign in",style: TextStyle(
                                color: colortheme.secondarycolor,
                                fontSize: w*0.05,
                                fontWeight: FontWeight.w700),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: w*0.03),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account ? ",style: TextStyle(
                          color: colortheme.secondarycolor,
                          fontWeight: FontWeight.w500
                      ),),
                      Text("Create Now",style: TextStyle(
                          color: colortheme.secondarycolor,
                          fontWeight: FontWeight.w600
                      ),),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
