import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class datapassPage extends StatefulWidget {
  final String id;

  const datapassPage({super.key,
    required this.id,
  });
  @override
  State<datapassPage> createState() => _datapassPageState();
}

class _datapassPageState extends State<datapassPage> {
  List datapass=[];
  Map<String,dynamic> getDocument={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colortheme.primarycolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  QuerySnapshot<Map<String,dynamic>>data= await FirebaseFirestore.instance.collection("user").get();
                  datapass=data.docs;

                  DocumentSnapshot<Map<String,dynamic>> docdata=await FirebaseFirestore.instance.collection("user").doc(widget.id).get();
                  getDocument=docdata.data()!;

                  setState(() {
                  });
                },
                child: Container(
                  height: w*0.1,
                  width: w*0.2,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(w*0.03,),color: colortheme.secondarycolor),
                  child: Center(child: Text("Get",style: TextStyle(color: colortheme.primarycolor,fontWeight: FontWeight.w400),)),
                ),
              ),
            ),
            // Container(
            //   height: w*1.6,
            //   width: w*1,
            //   child: ListView.builder(
            //     itemCount: datapass.length,
            //       itemBuilder: (context, index) {
            //       return Container(
            //         height: w*1,
            //         width: w*1,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Text(datapass[index]["name"]),
            //             Text(datapass[index]["password"]),
            //             Text(datapass[index]["email"]),
            //             Text(datapass[index]["confirmpass"]),
            //           ],
            //         ),
            //       );
            //       },),
            // )
            SizedBox(height: w*0.05),
            Container(
              height: w*0.3,
              width: w*1,
              child: Column(
                children: [
                  Text(getDocument["name"].toString() ?? ""),
                  Text(getDocument["email"].toString() ?? ""),
                  Text(getDocument["password"].toString() ?? ""),
                  //Text(getDocument["confirmpass"].toString() ?? ""),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
