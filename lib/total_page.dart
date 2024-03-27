import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Images/imagepicture.dart';
import 'package:crud/colors/colortheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';


//public
class totalPage extends StatefulWidget {
  const totalPage({super.key});

  @override
  State<totalPage> createState() => _totalPageState();
}

//PRIVATE CLS
class _totalPageState extends State<totalPage> {


  List?cartitems=[];

  List Cart=[
    {
      "name":"BURGER",
      "quantity":0,
      "price":120,
      "image":imagepicture.brgr
    },
    {
      "name":"PIZZA",
      "quantity":0,
      "price":100,
      "image":imagepicture.pizza
    },
    {
      "name":"SANDWICH",
      "quantity":0,
      "price":70,
      "image":imagepicture.sandwich
    },
    {
      "name":"COLA",
      "quantity":0,
      "price":50,
      "image":imagepicture.cola
    },
    {
      "name":"SHAWARMA",
      "quantity":0,
      "price":80,
      "image":imagepicture.shawarma
    },
    {
      "name":"SHAWAYA",
      "quantity":0,
      "price":120,
      "image":imagepicture.shawaya
    },
  ];

  List<QueryDocumentSnapshot<Map<String,dynamic>>>? data;
  getdata() async {
    await FirebaseFirestore.instance.collection("Carts").snapshots().listen((event) {
      data=event.docs;
      total=0;
      for (int i=0;i<data!.length;i++){
        total=data![i]["price"]*data![i]["quantity"]+total;
      }
      setState(() {
        
      });
    });
  }

// addList() {
//   for (int i = 0; i < Cart.length; i++) {
//     FirebaseFirestore.instance.collection("Carts").doc("Cart$i").set(Cart[i]);
//   }
// }

  bool addcart=false;
  int total=0;

  addcost(){
  }
  @override
  void initState() {
    // TODO: implement initState
    // addList();
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colortheme.primarycolor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: w*0.12,
        width: w*1,
        color:colortheme.sixthcolor.withOpacity(0.9),
        child: Center(
          child: Text("Total :$total",style: TextStyle(fontWeight:FontWeight.w700,
          fontSize: w*0.06
          ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colortheme.primarycolor.withOpacity(0.4),
        centerTitle: true,
        title: Text("MENU",style: TextStyle(color: colortheme.thirdcolor,
        fontWeight: FontWeight.w700,fontSize: w*0.05
        ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.02),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Carts").snapshots(),
          builder: (context,snapshot) {
            // var data=snapshot.data!.docs;
            // return data.length==0?
            // Center(child: Text("No Users Found")):
             return ListView.builder(
               shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                 //print(data?.length);
                 //print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA""""""");
                  return Padding(
                    padding:  EdgeInsets.all(w*0.02),
                    child: Container(
                      height: w*0.3,
                      width: w*1,
                      decoration: BoxDecoration(color:colortheme.primarycolor,
                        borderRadius: BorderRadius.circular(w*0.03),
                        boxShadow:[BoxShadow(
                            color: colortheme.thirdcolor.withOpacity(0.4),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            spreadRadius: 0

                        )],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: w*0.25,
                            width: w*0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              color: colortheme.primarycolor,
                            ),
                            child: Image.asset(data![index]["image"],fit: BoxFit.fill,),
                          ),
                          Container(
                            height: w*0.27,
                            width: w*0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(data![index]["name"],style: TextStyle(fontWeight: FontWeight.w600,
                                        fontSize: w*0.05
                                    ),),
                                    Text(data![index]["price"].toString(),style: TextStyle(
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          data![index]["quantity"] != 0 ?Container(
                            height: w*0.1,
                            width: w*0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.03),
                                color: colortheme.sixthcolor.withOpacity(0.5)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: ()  {
                                      FirebaseFirestore.instance.collection("Carts").doc(data![index].id).update(
                                          {"quantity":data![index]["quantity"]-1
                                          });
                                      print("INCREMENT-${data![index]["quantity"]-1}");
                                      setState(() {

                                      });
                                    },
                                    child: Icon(CupertinoIcons.minus_circled,)),
                                Text(data![index]["quantity"].toString(),style: TextStyle(
                                    color: colortheme.thirdcolor
                                ),),
                                InkWell(
                                    onTap: () {
                                     FirebaseFirestore.instance.collection("Carts").doc(data![index].id).update(
                                         {"quantity":data![index]["quantity"]+1
                                         });
                                     print("INCREMENT-${data![index]["quantity"]+1}");
                                     setState(() {

                                     });
                                    },
                                    child: Icon(CupertinoIcons.add))
                              ],
                            ),
                          )
                              :InkWell(
                            onTap: () {
                              FirebaseFirestore.instance.collection("Carts").doc(data![index].id).update(
                                  {"quantity":data![index]["quantity"]+1
                                  });
                              print("INCREMENT-${data![index]["quantity"]+1}");
                              setState(() {

                              });
                            },
                            child: Container(
                              height: w*0.1,
                              width: w*0.26,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w*0.03),
                                  color: colortheme.sixthcolor.withOpacity(0.5)
                              ),
                              child: Center(child: Text("ADD",style: TextStyle(fontWeight: FontWeight.w700),)),
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                }
            );
          },
        ),
      ),
    );
  }
}
