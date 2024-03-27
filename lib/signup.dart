//import 'dart:html';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/homepage.dart';
import 'package:crud/logins/login_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  final emailValidation = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final passwordValidation =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
   final formKey=GlobalKey<FormState>();

  bool locks1 = false;
  bool locks2 = false;
  var file;
  //var imageurl
  String imageurl = '';
  pickFile(ImageSource) async {
    final imageFile = await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(imageFile!.path);
    if (mounted) {
      setState(() {
        file = File(imageFile.path);
      });
      UploadFile(file);
    }
    //Navigator.pop(context);
  }
  UploadFile(File file) async {
    if(file!=null){
      var Uploadimage= await FirebaseStorage.instance
          .ref("images")
          .child("${DateTime.now()}")
          .putFile(file!,
      SettableMetadata(
        contentType: "image/jpg"
      ));

      imageurl=await Uploadimage.ref.getDownloadURL();
      setState(() {
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colortheme.primarycolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colortheme.primarycolor,
        leading: Padding(
          padding: EdgeInsets.all(w * 0.03),
          child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: SvgPicture.asset(imagepicture.left)),
        ),
        title: Text(
          "User Registration",
          style: TextStyle(
              color: colortheme.thirdcolor, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(children: [
                file != null
                    ? CircleAvatar(
                        radius: w * 0.25,
                        backgroundImage: FileImage(file!),
                      )
                    : CircleAvatar(
                        radius: w * 0.25,
                        backgroundImage:
                            const AssetImage(imagepicture.prof_pic),
                      ),
                Positioned(
                    left: w * 0.35,
                    top: w * 0.4,
                    child: InkWell(
                        onTap: () {
                          setState(() {});
                          showModalBottomSheet(
                            backgroundColor:
                                colortheme.primarycolor.withOpacity(0),
                            constraints: BoxConstraints(
                              maxWidth: w * 0.9,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(w * 0.03),
                              topLeft: Radius.circular(w * 0.03),
                            )),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: w * 0.55,
                                child: Column(
                                  children: [
                                    Container(
                                      height: w * 0.3,
                                      width: w * 0.9,
                                      decoration: BoxDecoration(
                                        color: colortheme.primarycolor,
                                        borderRadius:
                                            BorderRadius.circular(w * 0.03),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                pickFile(ImageSource.gallery);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text(
                                              "Photo Gallery",
                                              style: TextStyle(
                                                  color:
                                                      colortheme.seventhcolor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Divider(
                                            color: colortheme.thirdcolor,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                pickFile(ImageSource.camera);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text(
                                              "Camera",
                                              style: TextStyle(
                                                  color:
                                                      colortheme.seventhcolor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: w * 0.02),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: w * 0.15,
                                        width: w * 0.9,
                                        decoration: BoxDecoration(
                                          color: colortheme.primarycolor,
                                          borderRadius:
                                              BorderRadius.circular(w * 0.03),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color: colortheme.seventhcolor,
                                              fontWeight: FontWeight.w700),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: colortheme.secondarycolor,
                          radius: w * 0.05,
                          child: SvgPicture.asset(imagepicture.prof_edit),
                        )))
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(w * 0.05),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: fullnameController,
                      style: TextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide: BorderSide(
                                color: colortheme.sixthcolor.withOpacity(0.25))),
                        suffixIcon: Padding(
                            padding: EdgeInsets.all(w * 0.02),
                            child: Icon(Icons.person)),
                        fillColor: colortheme.sixthcolor.withOpacity(0.25),
                        filled: true,
                        labelText: "Full name",
                        labelStyle: TextStyle(
                            color: colortheme.thirdcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: w * 0.03),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if(
                        !emailValidation.hasMatch(value!)
                        ){
                          return "Enter Valid Email";
                        }
                        else
                          {
                            return null;
                          }
                      },
                      style: TextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide: BorderSide(
                                color: colortheme.sixthcolor.withOpacity(0.25))),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(w * 0.02),
                          child: Icon(Icons.email_outlined),
                        ),
                        fillColor: colortheme.sixthcolor.withOpacity(0.25),
                        filled: true,
                        labelText: "Valid email",
                        labelStyle: TextStyle(
                            color: colortheme.thirdcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: w * 0.03),
                    TextFormField(
                      controller: passswordController,
                      obscureText: locks1 == true ? false : true,
                      validator: (value) {
                        if(
                        !passwordValidation.hasMatch(value!)
                        ){
                          return "Enter Valid Password";
                        }
                        else{
                          return null;
                        }
                      },
                      style: TextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide: BorderSide(
                                color: colortheme.sixthcolor.withOpacity(0.25))),
                        fillColor: colortheme.sixthcolor.withOpacity(0.25),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(w * 0.02),
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  locks1 = !locks1;
                                });
                              },
                              child: Icon(locks1
                                  ? Icons.lock_open_outlined
                                  : Icons.lock_outline_rounded)),
                        ),
                        filled: true,
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: colortheme.thirdcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: w * 0.03),
                    TextFormField(
                      controller: confirmpassController,
                      obscureText: locks2 == true ? false : true,
                      style: TextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide: BorderSide(
                                color: colortheme.sixthcolor.withOpacity(0.25))),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(w * 0.02),
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  locks2 = !locks2;
                                });
                              },
                              child: Icon(locks2
                                  ? Icons.lock_open_outlined
                                  : Icons.lock_outline_rounded)),
                        ),
                        fillColor: colortheme.sixthcolor.withOpacity(0.25),
                        filled: true,
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(
                            color: colortheme.thirdcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: w * 0.4,
              width: w * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if(
                      fullnameController.text!=""&&
                      emailController.text!=""&&
                      passswordController.text!=""&&
                      confirmpassController.text!=""&&
                      formKey.currentState!.validate()
                      ){
                        FirebaseFirestore.instance.collection("SigUsers").add(
                            {
                              "name":fullnameController.text,
                              "email":emailController.text,
                              "password":passswordController.text,
                              "confirmpass":confirmpassController.text
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Sucessfully")));
                      }
                      else
                        {
                          fullnameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Your Fullname"))):
                          emailController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Your Email"))):
                          passswordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Your Password"))):
                          confirmpassController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Confirm the Password"))):
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Valid Details")));
                        }

                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passswordController.text).then((value) {
                          },);
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),)).catchError();

                    },

                    child: Container(
                      height: w * 0.13,
                      width: w * 0.6,
                      decoration: BoxDecoration(
                          color: colortheme.primarycolor,
                          borderRadius: BorderRadius.circular(w * 0.07),
                          border: Border.all(
                              color: colortheme.secondarycolor,
                              width: w * 0.006)),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: colortheme.secondarycolor,
                              fontSize: w * 0.05,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account ",
                        style: TextStyle(
                            color: colortheme.secondarycolor,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => loginpagenew(),
                                ));
                          });
                        },
                        child: Text(
                          "Login?",
                          style: TextStyle(
                              color: colortheme.secondarycolor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
