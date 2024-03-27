import 'dart:convert';

import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart'as http;

import 'main.dart';

class apiPage extends StatefulWidget {
  const apiPage({super.key});

  @override
  State<apiPage> createState() => _apiPageState();
}

class _apiPageState extends State<apiPage> {
  List apiData=[];
  List postoffice=[];
  List postofficename=[];

  
  getApiData() async {
    http.Response data=await http.get(Uri.tryParse("https://api.postalpincode.in/pincode/679322")!);
    var decodeApi=jsonDecode(data.body);
    apiData=decodeApi;
    postoffice=apiData[0]['PostOffice'];
    postofficename=postoffice[0]['Name'];
    setState(() {

    });
  }
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
              Navigator.pop(context);
            },
              child: SvgPicture.asset(imagepicture.left)),
        ),
        centerTitle: true,
        title: Text("Postal Codes",style: TextStyle(
            color: colortheme.thirdcolor,
            fontWeight: FontWeight.w700),),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Text(ap.toString()),
              SizedBox(height: w*0.03),
              TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.02),
                        borderSide: BorderSide(color: colortheme.eightcolor)
                    ),
                    fillColor: colortheme.eightcolor,
                    filled: true,
                    prefixIcon: Icon(Icons.search_outlined),
                    prefixIconColor:colortheme.seventhcolor,
                    labelText: "Enter Pincode",labelStyle: TextStyle(
                    color: colortheme.eleventhcolor,fontWeight: FontWeight.w600
                ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(w*0.04),
                        borderSide: BorderSide(color: colortheme.secondarycolor)
                    )
                ),
              ),
              SizedBox(height: w*0.03),
              ElevatedButton(onPressed: () {getApiData();}, child: Text("Get")),
              Container(
                height: w*2,
                width: w*1,
                child: ListView.builder(
                  itemCount:postoffice.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: w*0.2,
                      width: w*1,
                      margin: EdgeInsets.only(bottom: w*0.03),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(w*0.03),
                          color: colortheme.eightcolor),
                      child: Padding(
                        padding:  EdgeInsets.all(w*0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Postoffice: ${postoffice[index]['Name']}",style: TextStyle(
                        color: colortheme.thirdcolor,
                            fontWeight: FontWeight.w600),),
                            Text("District: ${postoffice[index]['District']}",style: TextStyle(
                        color: colortheme.thirdcolor,
                            fontWeight: FontWeight.w600),),
                            Text("Pincode : ${postoffice[index]['Pincode']}",style: TextStyle(
                                color: colortheme.thirdcolor,
                                fontWeight: FontWeight.w600),),
                          ],
                        ),
                      )
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
