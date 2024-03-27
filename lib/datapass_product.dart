
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';
class datapassProduct extends StatefulWidget {
  final List b;
  //final int a;


  const datapassProduct({super.key, required this.b,
    //required this.a,


  });

  @override
  State<datapassProduct> createState() => _datapassProductState();
}

class _datapassProductState extends State<datapassProduct> {


  pickFile(ImageSource) async {
    final imageFile=await ImagePicker.platform.pickImage(source: ImageSource);
    var file=File(imageFile!.path);
    if(mounted){
      setState(() {
        file=File(imageFile.path);
      });
    }
  }


  int currentquantity=0;

  int index=0;
  int total=0;

  getTotal(){
    total=0;
    for(int i=0; i<widget.b.length; i++){
      total=widget.b[i]["quantity"]*widget.b[i]["price"]+total;
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: w*0.12,
        width: w*1,
        color:Colors.white,
        child: Center(
          child: Text("Total :$total",style: TextStyle(fontWeight:FontWeight.w700,
              fontSize: w*0.06
          ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.01),
        child: ListView.builder(
          itemCount:widget.b.length,
          itemBuilder:(BuildContext context, int index) {

            return  Padding(
              padding:  EdgeInsets.only(bottom: w*0.014),
              child: Container(
                height:w*0.23,
                width: w*1,
                decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.25),
                borderRadius: BorderRadius.circular(w*0.03)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: w*0.2,
                      width: w*1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: w*0.2,
                            width: w*0.28,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            child: Image.file(widget.b[index]["image"],fit: BoxFit.fill,),
                          ),
                          Container(
                            height: w*0.2,
                            width: w*0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Text("Product :",style: TextStyle(fontWeight: FontWeight.w700),),
                                    Text(widget.b[index]["name"],style: TextStyle(fontWeight: FontWeight.w700),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Price :",style: TextStyle(fontWeight: FontWeight.w700),),
                                    Text(widget.b[index]["price"],style: TextStyle(fontWeight: FontWeight.w600),),
                                  ],
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //   children: [
                                //     Text("Quantity :",style: TextStyle(fontWeight: FontWeight.w700),),
                                //     Text(widget.b[index]["quantity"].toString(),style: TextStyle(fontWeight: FontWeight.w600),),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                            },
                            child: Container(
                              height: w*0.1,
                              width: w*0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(w*0.03)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        widget.b[index]["quantity"]<=0?0:widget.b[index]["quantity"]--;

                                        setState(() {

                                        });
                                        // getTotal();
                                        // setState(() {
                                        //
                                        // });
                                      },
                                      child: Icon(CupertinoIcons.minus_circle_fill)),
                                  Text(widget.b[index]["quantity"].toString()),
                                  InkWell(
                                      onTap: () {
                                                if (widget.b[index]["quantity"] < widget.b[index]["qty"]) {
                                                widget.b[index]["quantity"]++;
                                                }
                                                setState(() {

                                                });

                                        // setState(() {
                                        //   getTotal();
                                        // });
                                      },
                                      child: Icon(CupertinoIcons.add_circled_solid))
                                ],
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
          },
        ),
      ),
    );
  }
}
