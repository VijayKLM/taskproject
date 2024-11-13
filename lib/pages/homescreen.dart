import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/firebase/firebase.dart';
import 'package:demo_project/productlist.dart';
import 'package:demo_project/pages/productpage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    CollectionReference product = FirebaseFirestore.instance.collection("taskMenu");
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height,
                  color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Container(
                padding: EdgeInsets.all(10),
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height,
                 
                child: StreamBuilder(stream: product.snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot>StreamSnapshort){
                  if(StreamSnapshort.hasData){
                        
                    return ListView.builder(
                      
                      itemCount: StreamSnapshort.data!.docs.length,
                      itemBuilder:(context,index){
                       
                        var  valuesadd = StreamSnapshort.data!.docs[index];
                           var   nameData = valuesadd["name"];
                             var   priceData = valuesadd["price"];
                               var   imageData = valuesadd["image"];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            
                            width: 100,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.amberAccent[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Productpage(nameData: nameData, priceData: priceData, imageData: imageData)));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: 180,height: 180,
                                    
                                 
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                         
                                          Container(
                                            width: 140,height: 130,
                                            color: Colors.white10,
                                            child: Image.network(imageData,fit: BoxFit.fill,),
                                          ),
                                          SizedBox(height: 9,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                               Container(
                                            // width: 100,height: 20,
                                           
                                            child: Text(nameData),
                                          ),
                                          SizedBox(height: 3,),
                                           Container(
                                          // width: 100,height: 20,
                                            
                                            child: Text(priceData),
                                          ),
                                          SizedBox(height: 10,),

                                            ],
                                          ),
                                          
                                         
                                      ],
                                    ),
                                  ),
                                ),
                                
                              GestureDetector(
                                onTap: (){
                                   
                                  firebaseDatas().deletevalue(id: valuesadd.id);
                                   
                                },
                                child: Container(
                                  
                                  child: Icon(Icons.delete
                                  ),
                                ),
                              )
                               
                              ],
                            ),
                          ),
                        );
          
                    } );
                  }
                  return Center(child: CircularProgressIndicator(),);
                }
                
                ),
              ),]
              
          
          
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Productlist()));
      }),
    );
    
  }
}
