
import 'package:flutter/material.dart';

class Productpage extends StatelessWidget {
   final String   nameData ;
    final String priceData;
      final String  imageData ;

  const Productpage({super.key, required this.nameData, required this.priceData, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Container(
        child: SingleChildScrollView(
          child: Column(
            children:[
           
             Container(
              width:MediaQuery.of(context).size.width ,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.black26
              ),
              child:  Image.network(imageData,fit: BoxFit.fill,),
             ),
             SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(nameData),
                   Text(priceData),
                ],
              )
            ],
          ),
        ),
      )
      )
    );
  }
}