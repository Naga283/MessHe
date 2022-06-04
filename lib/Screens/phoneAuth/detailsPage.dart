// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../homePage.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
     CollectionReference ref =FirebaseFirestore.instance.collection("Users");
     var firebaseUser = FirebaseAuth.instance.currentUser;
    
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: Column(
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(hintText: "Enter Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
ref.add({
  "Name":name.text,
  "Phn No": firebaseUser?.phoneNumber,
  "UserId": firebaseUser?.uid,
}).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage())));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
              color: Colors.blue,
              child: Text("Save",style: TextStyle(fontSize: 16),)),
          )
        ],
      ),
    );
  }
}