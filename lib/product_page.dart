
import 'dart:io';
import 'package:crud/datapass.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'datapass_product.dart';
import 'main.dart';

class productPage extends StatefulWidget {
  const productPage({super.key});

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {


  var file;
  List image=[];
  int count=1;
  List <Map<String,dynamic>> products=[];





  pickFile(ImageSource) async {
    final imageFile=await ImagePicker.platform.pickImage(source: ImageSource);
    file=File(imageFile!.path);
    if(mounted){
      setState(() {
        file=File(imageFile.path);
      });
    }
  }


  TextEditingController productnameController=TextEditingController();
  TextEditingController pricecontroller=TextEditingController();
  TextEditingController quantitycontroller=TextEditingController();
  List<Map<String, dynamic>> productList = [];

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              file!=null? Container(
                height: w*0.3,
                width: w*0.3,
                //child: Image.file(file,fit:BoxFit.fill,),
                decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.25),
                    image: DecorationImage(image: FileImage(file),fit:BoxFit.fill),
                    borderRadius: BorderRadius.circular(w*0.03)
                ),
              ):Container(
                height: w*0.3,
                width: w*0.3,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(w*0.03)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      pickFile(ImageSource.camera);
                    },
                    child: Container(
                      height:w*0.1,
                      width:w*0.1,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(w*0.03)
                      ),
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pickFile(ImageSource.gallery);
                    },
                    child: Container(
                      height:w*0.1,
                      width:w*0.1,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(w*0.03)
                      ),
                      child: Icon(Icons.image),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: productnameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w*0.04),
                      borderSide: BorderSide(color:Colors.white.withOpacity(0.25))
                  ),
                  fillColor: Colors.blueAccent.withOpacity(0.25),
                  filled: true,
                  labelText: "Product Name",labelStyle: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.w500
                ),
                ),
              ),
              TextField(
                controller:quantitycontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w*0.04),
                      borderSide: BorderSide(color:Colors.white.withOpacity(0.25))
                  ),
                  fillColor: Colors.blueAccent.withOpacity(0.25),
                  filled: true,
                  labelText: "Quantity",labelStyle: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.w500
                ),
                ),
              ),
              TextField(
                controller: pricecontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w*0.04),
                      borderSide: BorderSide(color:Colors.white.withOpacity(0.25))
                  ),
                  fillColor: Colors.blueAccent.withOpacity(0.25),
                  filled: true,
                  labelText: "Price",labelStyle: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.w500
                ),
                ),
              ),
              InkWell(
                // onTap: () {
                //   if(count<1){
                //     count++;
                //   }
                //   else{
                //     count=0;
                //     Navigator.push(context,MaterialPageRoute(builder: (context) =>datapassProduct(name: productnameController.text,
                //         price: pricecontroller.text, imagefile: file,),));
                //   }
                // },
                onTap: () {
                  products.add({
                    "name":productnameController.text,
                    "price":pricecontroller.text,
                    "quantity":int.parse(quantitycontroller.text),
                    "qty":int.parse(quantitycontroller.text),
                    "image":file
                  });
                  if(products.length==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => datapassProduct(
                        b:products,),));

                  //  image.clear();
                  }
                },

                child: Container(
                  height: w*0.1,
                  width: w*0.3,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  child: Center(child: Text("Add")),
                ),
              ),
              // InkWell(
              //   // onTap: () {
              //   //   if (productnameController.text!=""&&
              //   //       pricecontroller.text!=""&&
              //   //       formKey.currentState!.validate()
              //   //   ){
              //   //     Navigator.push(context, MaterialPageRoute(builder: (context) => datapassProduct(
              //   //         name: productnameController.text,
              //   //         price: pricecontroller.text,
              //   //         )
              //   //     ));
              //   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted Sucessfully")));
              //   //   }
              //   //   else
              //   //   {
              //   //     productnameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter product Name"))):
              //   //     pricecontroller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter product Price"))):
              //   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Valid Details")));
              //   //   }
              //   //
              //   //   // nameController.clear();
              //   //   //numberController.clear();
              //   //   // emailController.clear();
              //   //   // passwordController.clear();
              //   //   //addressController.clear();
              //   //   //print(nameController);
              //   //   //  print(numberController);
              //   //   // print(emailController);
              //   //   // print(passwordController);
              //   //   //print(addressController);
              //   // },
              //   onTap: () {
              //      setState(() {
              //        Navigator.push(context, MaterialPageRoute(builder: (context) => datapassProduct(
              //            name: productnameController.text,
              //            price: pricecontroller.text),
              //        ));
              //      });
              //   },
              //
              //   child: Container(
              //     height: w*0.1,
              //     width: w*0.3,
              //    decoration: BoxDecoration(
              //      color: Colors.greenAccent.withOpacity(0.5),
              //      borderRadius: BorderRadius.circular(w*0.03)
              //    ),
              //     child: Center(child: Text("$dataList")),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
