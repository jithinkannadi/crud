import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:crud/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'main.dart';

class phonepage extends StatefulWidget {
  const phonepage({super.key});

  @override
  State<phonepage> createState() => _phonepageState();
}

class _phonepageState extends State<phonepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:colortheme.primarycolor,
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
        title: Text("Enter Phone Number",style: TextStyle(
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
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagepicture.phonep),fit: BoxFit.fill)),
            ),
            Padding(
              padding: EdgeInsets.all(w*0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IntlPhoneField(
                    dropdownTextStyle: TextStyle(color: colortheme.forthcolor),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.04),
                        borderSide: BorderSide(color: colortheme.secondarycolor)
                      ),
                      fillColor: colortheme.primarycolor,
                      filled: true,
                      labelStyle: TextStyle(
                          color: colortheme.thirdcolor,fontWeight: FontWeight.w500
                      ),
                    ),
                    style: TextStyle(color: colortheme.thirdcolor),
                  ),
                ],
              ),
            ),
            SizedBox(height: w*0.05),
            Container(
              height: w*0.7,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => otpPage(),));

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
                        child: Text("Send OTP",style: TextStyle(
                            color: colortheme.secondarycolor,
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w700),),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign in with ",style: TextStyle(
                          color: colortheme.secondarycolor,
                          fontWeight: FontWeight.w500
                      ),),
                      InkWell(
                        onTap: () {
                          setState(() {

                          });
                        },
                        child: Text(" Another Method ?",style: TextStyle(
                            color: colortheme.secondarycolor,
                            fontWeight: FontWeight.w600
                        ),),
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
