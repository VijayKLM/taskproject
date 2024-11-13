import 'package:demo_project/firebase/firebase.dart';
import 'package:demo_project/widget/textfield.dart';
import 'package:flutter/material.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  @override
  Widget build(BuildContext context) {
    TextEditingController image =TextEditingController();
     TextEditingController name =TextEditingController();
      TextEditingController price =TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Textfield(controller: image, hintText: "imagelink add"),
              SizedBox(height: 10,),
              Textfield(controller: name, hintText: "name add"),
              SizedBox(height: 10,),
              Textfield(controller: price, hintText: "price add"),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: 
              (){
               firebaseDatas().valuesadd(context: context, name: name.text, price: price.text, image: image.text);
               image.clear();
               name.clear();
               price.clear();
              }, child: Text("submite data"))
          
            ],
          ),
        ),
        
      ),
    );
  }
}