import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/deletepage.dart';
import 'package:crud/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/useredit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';

class editUserPage extends StatefulWidget {
  // final String name;
  // final String email;
  // final String password;
  // final String confirmpass;
  final Usermodel editt;
  const editUserPage({super.key,
    // required this.name,
    // required this.email,
    // required this.password,
    // required this.confirmpass,
    required this.editt,
  });

  @override
  State<editUserPage> createState() => _editUserPageState();
}

class _editUserPageState extends State<editUserPage> {
  TextEditingController fullnameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpassController=TextEditingController();

  final emailValidation=RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // final formKey=GlobalKey<FormState>();

  bool lock=false;
  bool lock2=false;
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




@override
  void initState() {
    // TODO: implement initState
  fullnameController.text=widget.editt.username.toString();
  emailController.text=widget.editt.email.toString();
  passwordController.text=widget.editt.password.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        title: Text("Edit User",style: TextStyle(
            color: colortheme.thirdcolor,
            fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child:
              Stack(children: [
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
              padding:  EdgeInsets.all(w*0.05),
              child: Column(
                children: [
                  TextFormField(
                    controller: fullnameController,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.04),
                          borderSide: BorderSide(color:colortheme.sixthcolor.withOpacity(0.25))
                      ),
                      suffixIcon: Padding(
                        padding:  EdgeInsets.all(w*0.02),
                        child: Icon(Icons.person),
                      ),
                      fillColor:colortheme.sixthcolor.withOpacity(0.25),
                      filled: true,
                      labelText: "Full name",labelStyle: TextStyle(
                        color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                  SizedBox(height: w*0.03),
                  TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!emailValidation.hasMatch(value!)){
                        return "Enter valid Email";
                      }
                      else
                        {return null;}
                    },
                    style: TextStyle(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.04),
                          borderSide: BorderSide(color: colortheme.sixthcolor.withOpacity(0.25))
                      ),
                      suffixIcon: Padding(
                        padding:  EdgeInsets.all(w*0.02),
                        child:Icon(Icons.email_outlined)
                      ),
                      fillColor:colortheme.sixthcolor.withOpacity(0.25),
                      filled: true,
                      labelText: "Valid email",labelStyle: TextStyle(
                        color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                  SizedBox(height: w*0.03),
                  TextFormField(
                    controller: passwordController,
                    obscureText: lock==true?false:true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!passwordValidation.hasMatch(value!)){
                        return "Enter Valid Password";
                      }
                      else
                        {
                          return null;
                        }
                    },
                    style: TextStyle(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.04),
                          borderSide: BorderSide(color: colortheme.sixthcolor.withOpacity(0.25))
                      ),
                      fillColor:colortheme.sixthcolor.withOpacity(0.25),
                      suffixIcon: Padding(
                        padding:  EdgeInsets.all(w*0.02),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              lock=!lock;
                            });
                          },

                            child: Icon(lock?Icons.lock_open_outlined:Icons.lock_outline_rounded))
                      ),
                      filled: true,
                      labelText: "Password",labelStyle: TextStyle(
                        color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                  SizedBox(height: w*0.03),
                  TextFormField(
                    controller: confirmpassController,
                    obscureText: lock2==true?false:true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(passwordController.text!=confirmpassController.text)
                      {
                        return "Passwords does not Match";
                      }
                      else{
                        return null;
                      }
                    },
                    style: TextStyle(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.04),
                          borderSide: BorderSide(color: colortheme.sixthcolor.withOpacity(0.25))
                      ),
                      suffixIcon: Padding(
                        padding:  EdgeInsets.all(w*0.02),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              lock2=!lock2;
                            });
                          },
                            child: Icon(lock2?Icons.lock_open_outlined:Icons.lock_outline_rounded))
                      ),
                      fillColor: colortheme.sixthcolor.withOpacity(0.25),
                      filled: true,
                      labelText: "Confirm Password",labelStyle: TextStyle(
                        color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: w*0.4,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      FirebaseFirestore.instance.collection("Usersadd").doc(widget.editt.id).update(widget.editt.copyWith(
                        email: emailController.text
                      ).toMap());
                      // FirebaseFirestore.instance.collection("student").doc(widget.email).update({
                      //   "name":fullnameController.text,
                      //   "email":emailController.text,
                      //   "password":passwordController.text,
                      //   "confirmpass":confirmpassController.text,
                      // });
                     Navigator.push(context, MaterialPageRoute(builder: (context) => deletePage(),));
                    },
                    child: Container(
                      height: w*0.13,
                      width: w*0.6,
                      decoration: BoxDecoration(color: colortheme.primarycolor,
                          borderRadius: BorderRadius.circular(w*0.07),
                          border: Border.all(color:colortheme.secondarycolor,width: w*0.006)

                      ),
                      child: Center(
                        child: Text("Edit User",style: TextStyle(
                            color: colortheme.secondarycolor,
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w700 ),),
                      ),
                    ),
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
