import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class firebaseDatas {
  Future<void> valuesadd({
    required BuildContext context,
    required String name,
   required String price,
   required String image,
  })async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("taskMenu");
    Map<String,dynamic> valusaddLoop ={
      "name":name,
      "price":price,
      "image":image,

    };
    try{
         await collectionReference.add(valusaddLoop);
    }catch(e){
      print("values not add");
    }
   
  }


  Future<void> deletevalue ({
     required String id,
  })async{
      
      
      try{
         await  FirebaseFirestore.instance.collection("taskMenu").doc(id).delete();
      }catch(e){

      }

  }

  

}