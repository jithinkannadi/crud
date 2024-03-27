import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Images/imagepicture.dart';
import 'package:crud/adduser.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/datapass.dart';
import 'package:crud/edituser.dart';
import 'package:crud/logins/logins.dart';
import 'package:crud/useredit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';
import 'models/user_model.dart';

class deletePage extends StatefulWidget {
  const deletePage({super.key});

  @override
  State<deletePage> createState() => _deletePageState();
}

class _deletePageState extends State<deletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => addUserPage(),));
          },
        backgroundColor: colortheme.secondarycolor,
        child: Icon(Icons.add),

      ),
      backgroundColor: colortheme.primarycolor,
      appBar: AppBar(
        backgroundColor: colortheme.primarycolor,
        elevation: 0,
        title: Text("Hello,$username",style: TextStyle(
            color: colortheme.thirdcolor,
            fontWeight: FontWeight.w700),),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => userEditConfirm(),));
              });
            },
            child: CircleAvatar(
              radius: w*0.05,
              backgroundImage: AssetImage(imagepicture.prof_pic),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(w*0.03),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage(),));
              },
                child: SvgPicture.asset(imagepicture.logout)),
          )
        ],
      ),
      body:
      Padding(
        padding:  EdgeInsets.all(w*0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Current Users",style: TextStyle(
                    fontSize: w*0.06,
                      color: colortheme.thirdcolor,
                      fontWeight: FontWeight.w600),),
                ],
              ),
              Container(
                height: w*2,
                width: w*1,
                child: StreamBuilder<List<Usermodel>>(
                  stream: FirebaseFirestore.instance.collection("Usersadd")
                      .snapshots().map((event) => event.docs.map((e) => Usermodel.fromMap(e.data())).toList()),

                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(child: Text("No Document Found"));
                    }
                    var data=snapshot.data!;
                    return data.length==0?
                        Center(child: Text("No Users Found")):
                     ListView.builder(
                      itemCount:data.length,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => datapassPage(id: data[index].id.toString(),),));
                          },
                          child: Container(
                            height: w*0.2,
                            width: w*1,
                            margin: EdgeInsets.only(bottom: w*0.03),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(w*0.03),
                                color: colortheme.eightcolor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: w*0.08,
                                  backgroundColor: colortheme.eightcolor,
                                  backgroundImage:AssetImage(imagepicture.boy_stand),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(data[index].username.toString(),style: TextStyle(color:colortheme.thirdcolor,
                                        fontWeight: FontWeight.w700,
                                      )),
                                      Text(data[index].email.toString(),style: TextStyle(color:colortheme.thirdcolor,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.all(w*0.02),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: Text("Are you Sure\n"
                                                        "You Want to delete User ?",style: TextStyle(
                                                      fontSize: w*0.04,
                                                        fontWeight: FontWeight.w500,color: colortheme.thirdcolor
                                                    )),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        onPressed: () {
                                                          FirebaseFirestore.instance.collection("Usersadd").doc(data[index].email.toString()).delete();
                                                          Navigator.pop(context);
                                                        },
                                                        isDestructiveAction: true,
                                                        child: Text("Yes",style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          color: colortheme.tenthcolor
                                                        ),
                                                        ),
                                                      ),
                                                      CupertinoDialogAction(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text("Cancel",style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                            color:colortheme.seventhcolor
                                                        )),
                                                      ),
                                                      SizedBox(height: w*0.0001)
                                                    ],
                                                  );
                                                },);
                                            },
                                            child: SvgPicture.asset(imagepicture.delete_red)),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.all(w*0.02),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => editUserPage(
                                              /*  name: data[index].username.toString(),
                                                email: data[index].email.toString(),
                                                password: data[index].password.toString(),
                                                confirmpass: data[index].confirm.toString(),*/
                                                editt:data[index],


                                              ),));
                                            });

                                          },
                                            child: SvgPicture.asset(imagepicture.pen_big)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


