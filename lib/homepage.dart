import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud/Images/imagepicture.dart';
import 'package:crud/api.dart';
import 'package:crud/banner.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/deletepage.dart';
import 'package:crud/edituser.dart';
import 'package:crud/logins/logins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String ? name="";
  List preview=[imagepicture.homepagepic,imagepicture.banner1];
  getUsername() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
     username =prefs.getString('username')??'';
     setState(() {

     });
  }
  @override
  void initState() {
    getUsername();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colortheme.primarycolor,
      appBar: AppBar(
        backgroundColor: colortheme.primarycolor,
        elevation: 0,
        leadingWidth: 0,
        title: Text("Hello,$username",style: TextStyle(
            color: colortheme.thirdcolor,
            fontWeight: FontWeight.w600),),
        actions: [
          InkWell(
            onTap: () {
              // setState(() {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => editUserPage(),));
              // });
            },
            child: CircleAvatar(radius: w*0.05,
              backgroundImage: AssetImage(imagepicture.prof_pic),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(w*0.03),
            child: InkWell(
              onTap: () async {
                SharedPreferences prefs=await SharedPreferences.getInstance();
                prefs.remove('login');
                GoogleSignIn().signOut();
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage(),));
                });
              },
                child: SvgPicture.asset(imagepicture.logout)),
          )
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(w*0.02),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: preview.length,
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: Duration(
                    seconds: 1,
                  ),
                  onPageChanged: (index, reason) {
                    setState(() {

                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    height: w * 0.5,
                    width: w * 0.9,
                    margin: EdgeInsets.only(right: w * 0.03),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(preview[index]), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(w * 0.03)),
                  );
                },
              ),
              SizedBox(height: w*0.03),
              AnimatedSmoothIndicator(
                activeIndex: 0,
                count:preview.length,
                effect: ExpandingDotsEffect(
                  activeDotColor:colortheme.thirdcolor,
                  dotColor:colortheme.sixthcolor,
                  dotHeight: w * 0.02,
                  dotWidth:w* 0.02,
                ),
              ),
              SizedBox(height: w*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                       setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => deletePage(),));
                       });
                        },
                        child: Container(
                          height: w*0.4,
                          width: w*0.4,
                          decoration: BoxDecoration(color: colortheme.primarycolor,
                              borderRadius: BorderRadius.circular(w*0.09),
                              boxShadow:[ BoxShadow(color:Colors.black.withOpacity(0.13),
                                blurRadius: 9,
                                spreadRadius: 6,
                                offset: Offset(0, 4),
                              ),]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: w*0.2,
                                  width: w*0.15,
                                  child: Image.asset(imagepicture.crud_yellow,)),
                              Text("CRUD",style: TextStyle(
                                  color: colortheme.thirdcolor,
                                  fontSize: w*0.06,
                                  fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: w*0.06),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => apiPage(),));
                          });
                        },
                        child: Container(
                          height: w*0.4,
                          width: w*0.4,
                          decoration: BoxDecoration(color: colortheme.primarycolor,
                              borderRadius: BorderRadius.circular(w*0.09),
                              boxShadow:[ BoxShadow(color:Colors.black.withOpacity(0.13),
                                blurRadius: 9,
                                spreadRadius: 6,
                                offset: Offset(0, 4),
                              ),]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: w*0.3,
                                  width: w*0.3,
                                  child: Image.asset(imagepicture.crud_api,fit: BoxFit.fill,)),
                              Text("API",style: TextStyle(
                                  color: colortheme.thirdcolor,
                                  fontSize: w*0.06,
                                  fontWeight: FontWeight.w600),)

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => bannerPage(),));
                          });
                        },
                        child: Container(
                          height: w*0.4,
                          width: w*0.4,
                          decoration: BoxDecoration(color: colortheme.primarycolor,
                              borderRadius: BorderRadius.circular(w*0.09),
                              boxShadow:[ BoxShadow(
                                color:colortheme.thirdcolor.withOpacity(0.13),
                                blurRadius: 9,
                                spreadRadius: 6,
                                offset: Offset(0, 4),
                              ),]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: w*0.4,
                                  width: w*0.4,
                                  child: Image.asset(imagepicture.crud_cloud,fit: BoxFit.fill,)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
