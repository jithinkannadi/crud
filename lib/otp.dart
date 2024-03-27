import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class otpPage extends StatefulWidget {
  const otpPage({super.key});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
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
        title: Text("Verify OTP",style: TextStyle(
            color: colortheme.thirdcolor,
            fontWeight: FontWeight.w500),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: w*0.7,
              width: w*1,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagepicture.otp),fit: BoxFit.fill)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("OTP has been sent to",style: TextStyle(
                        color: colortheme.forthcolor,
                        fontSize: w*0.04,
                        fontWeight: FontWeight.w500),),
                    Text("*****634",style: TextStyle(
                        color: colortheme.secondarycolor,
                        fontSize: w*0.04,
                        fontWeight: FontWeight.w500),),
                    SizedBox(width: w*0.03),
                    InkWell(
                      onTap: () {
                        setState(() {

                        });
                      },
                        child: SvgPicture.asset(imagepicture.edit))
                  ],
                ),
                FractionallySizedBox(
                    child: Padding(
                      padding:  EdgeInsets.all(w*0.05),
                      child: Pinput(
                        length:6,
                        closeKeyboardWhenCompleted: true,
                      ),
                    )),

              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));

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
                      child: Text("Verify",style: TextStyle(
                          color: colortheme.secondarycolor,
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w700),),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: w*0.04),
            Container(
              height: w*0.5,
              width: w*1,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Haven't got the confirmation code yet? ",style: TextStyle(
                         color: colortheme.thirdcolor,
                         fontWeight: FontWeight.w400),),
                     InkWell(
                       onTap: () {
                         setState(() {

                         });
                       },
                       child: Text("Resend",style: TextStyle(
                           color: colortheme.secondarycolor,
                           fontWeight: FontWeight.w600),),
                     ),
                   ],
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Try Another ",style: TextStyle(
                         color: colortheme.thirdcolor,
                         fontWeight: FontWeight.w400),),
                     InkWell(
                       onTap: () {
                         setState(() {

                         });
                       },
                       child: Text("Method?",style: TextStyle(
                           color: colortheme.secondarycolor,
                           fontWeight: FontWeight.w700),),
                     )
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
