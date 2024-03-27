import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/homepage.dart';
import 'package:crud/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class userEditConfirm extends StatefulWidget {
  const userEditConfirm({super.key});

  @override
  State<userEditConfirm> createState() => _userEditConfirmState();
}

class _userEditConfirmState extends State<userEditConfirm> {
  TextEditingController usernameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passswordController=TextEditingController();




  final emailValidation=RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // final formKey=GlobalKey<FormState>();


  var file;
  pickFile(ImageSource)async{
    final imageFile=await ImagePicker.platform.pickImage(source: ImageSource);
    file=File(imageFile!.path);
    if(mounted){
      setState(() {
        file=File(imageFile.path);
      });
    }
  }



  bool pass=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colortheme.primarycolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colortheme.primarycolor,
        leading: Padding(
          padding:  EdgeInsets.all(w*0.03),
          child: InkWell(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
              child: SvgPicture.asset(imagepicture.left)),
        ),
        centerTitle: true,
        title: Text("Profile",style: TextStyle(
            color: colortheme.thirdcolor,
            fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child:
              Stack(children: [
          file!=null?CircleAvatar(
          radius: w*0.25,backgroundImage:FileImage(file!),
        ):CircleAvatar(radius: w*0.25,
        backgroundImage: AssetImage(imagepicture.prof_pic),
      ),
                Positioned(
                    left: w*0.35,
                    top: w*0.4,
                    child: InkWell(
                        onTap: () {
                          setState(() {

                          });
                          showModalBottomSheet(
                            backgroundColor: colortheme.primarycolor.withOpacity(0),
                            constraints:BoxConstraints(
                              maxWidth: w*0.9,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.only(
                                  topRight: Radius.circular(w*0.03),
                                  topLeft: Radius.circular(w*0.03),
                                )
                            ),

                            context: context, builder: (context) {
                            return Container(
                              height: w*0.55,
                              child: Column(
                                children: [
                                  Container(
                                    height: w*0.3,
                                    width: w*0.9,
                                    decoration: BoxDecoration(
                                      color: colortheme.primarycolor,
                                      borderRadius: BorderRadius.circular(w*0.03),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              pickFile(ImageSource.gallery);
                                            });
                                          },
                                          child: Text("Photo Gallery",style: TextStyle(
                                              color: colortheme.seventhcolor,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        Divider(
                                          color: colortheme.thirdcolor,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              pickFile(ImageSource.camera);
                                            });
                                          },
                                          child: Text("Camera",style: TextStyle(
                                              color: colortheme.seventhcolor,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: w*0.02),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: w*0.15,
                                      width: w*0.9,
                                      decoration: BoxDecoration(
                                        color: colortheme.primarycolor,
                                        borderRadius: BorderRadius.circular(w*0.03),
                                      ),
                                      child: Center(child: Text("Cancel",style: TextStyle(
                                          color: colortheme.seventhcolor,
                                          fontWeight: FontWeight.w700),)),
                                    ),
                                  )
                                ],
                              ),

                            );
                          },);
                        },

                        child: SvgPicture.asset(imagepicture.prof_edit)))
              ]
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(w*0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: usernameController,
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
                    controller: emailController,
                    validator: (value) {
                      if(!emailValidation.hasMatch(value!))
                      {
                        return "Enter valid Email";
                      }
                      else{
                        return null;
                      }
                    },
                    style: TextStyle(),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.04),
                            borderSide: BorderSide(color: colortheme.secondarycolor)
                        ),
                        fillColor: colortheme.primarycolor,
                        filled: true,
                        labelText: "Email",labelStyle: TextStyle(
                        color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                    ),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(w*0.04),
                            borderSide: BorderSide(color: colortheme.secondarycolor)
                        )
                    ),
                  ),
                  SizedBox(height: w*0.04),
                  TextFormField(
                    controller: passswordController,
                    validator: (value) {
                      if(!passwordValidation.hasMatch(value!)){
                        return "Enter valid Password";
                      }
                      else{
                        return null;
                      }
                    },
                    style: TextStyle(),
                    obscureText: pass==true?false:true,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding:  EdgeInsets.all(w*0.03),
                          child: InkWell(
                              onTap: () {
                                pass=!pass;
                                setState(() {

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
                ],),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Are you Sure\n"
                            "You Want to Update Details?",style: TextStyle(fontWeight: FontWeight.w400,
                            color: colortheme.thirdcolor,
                          ),),
                          actions: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    child: Text("Confirm",style: TextStyle(color: colortheme.seventhcolor,
                                      fontWeight: FontWeight.w400,
                                    ),)),
                                Divider(color: Colors.black),
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                    child: Text("Cancel",style: TextStyle(color: colortheme.tenthcolor,
                                      fontWeight: FontWeight.w400,
                                    ),)),
                              ],
                            )

                          ],
                        );
                      },);
                  },
                  child: Container(
                    height: w*0.13,
                    width: w*0.6,
                    decoration: BoxDecoration(color: colortheme.primarycolor,
                        borderRadius: BorderRadius.circular(w*0.07),
                        border: Border.all(color:colortheme.secondarycolor,width: w*0.006)

                    ),
                    child: Center(
                      child: Text("Update",style: TextStyle(
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
      ),
    );
  }
}
