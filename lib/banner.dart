import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class bannerPage extends StatefulWidget {
  const bannerPage({super.key});

  @override
  State<bannerPage> createState() => _bannerPageState();
}

class _bannerPageState extends State<bannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Banner",style: TextStyle(
            color: colortheme.thirdcolor,
            fontWeight: FontWeight.w700),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:  EdgeInsets.all(w*0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(imagepicture.bannerr),
                SizedBox(height: w*0.03),
                TextFormField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.04),
                          borderSide: BorderSide(color: colortheme.secondarycolor)
                      ),
                      fillColor: colortheme.primarycolor,
                      filled: true,
                      labelText: "Title",labelStyle: TextStyle(
                      color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                  ),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(w*0.04),
                          borderSide: BorderSide(color: colortheme.secondarycolor)
                      )
                  ),
                ),
                SizedBox(height: w*0.03),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => otpPage(),));
                    });
                  },
                  child: Container(
                    height: w*0.13,
                  width: w*0.5,
                    decoration: BoxDecoration(color: colortheme.primarycolor,
                        borderRadius: BorderRadius.circular(w*0.03),
                        border: Border.all(color:colortheme.secondarycolor,width: w*0.006)
                    ),
                    child: Center(
                      child: Text("Upload Banner",style: TextStyle(
                          color: colortheme.secondarycolor,
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w700),),
                    ),
                  ),
                )
              ],
            ),
          ),
         Expanded(
           child: ListView.builder(
             itemCount: 3,
             physics: BouncingScrollPhysics(),
             itemBuilder: (BuildContext context, int index) {
               return Padding(
                 padding:  EdgeInsets.all(w*0.03),
                 child: Container(
                   height:w*0.3 ,
                   width: w*0.9,
                   decoration: BoxDecoration(
                       color:colortheme.eightcolor,
                       borderRadius: BorderRadius.circular(w*0.03),
                       boxShadow:[ BoxShadow(
                         color:colortheme.thirdcolor.withOpacity(0.4),
                         blurRadius: 4,
                         spreadRadius: 0,
                         offset: Offset(0, 4),
                       ),]
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         height:w*0.25 ,
                         width: w*0.5,
                         child:
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Container(
                               height: w*0.2,
                               width: w*0.3,
                               decoration: BoxDecoration(
                                   image: DecorationImage(image: AssetImage(imagepicture.banner1)),
                                   borderRadius: BorderRadius.circular(w*0.03)
                               ),
                             ),
                             SizedBox(width: w*0.03),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Banner 1",style: GoogleFonts.jacquesFrancois(
                                   textStyle: TextStyle(
                                       fontSize: w*0.05,
                                       color: colortheme.seventhcolor,
                                       fontWeight: FontWeight.w400),
                                 )),
                                 Text("2 May",style: GoogleFonts.inter(
                                   textStyle: TextStyle(
                                       fontSize: w*0.04,
                                       color: colortheme.thirdcolor,
                                       fontWeight: FontWeight.w400),
                                 )),
                               ],
                             ),
                           ],
                         ),
                       ),
                       Container(
                           height: w*0.08,
                           width: w*0.2,
                           child: SvgPicture.asset(imagepicture.delete_fill))
                     ],
                   ),
                 ),
               );
             },
           ),
         ),


        ],
      ),
    );
  }
}
