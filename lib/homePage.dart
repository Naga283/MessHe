import 'package:chattingappli/Screens/Authentication/authentication.dart';
import 'package:chattingappli/Screens/addingPersons.dart';
import 'package:chattingappli/Screens/phoneAuth/NewHomeScreen.dart';
import 'package:chattingappli/Screens/phoneAuth/detailsPage.dart';
import 'package:chattingappli/Screens/texting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 Authentication auth = Authentication();
 var firebaseUser = FirebaseAuth.instance.currentUser;
  CollectionReference ref =FirebaseFirestore.instance.collection("Users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("MessHe"),
      automaticallyImplyLeading: false,
      actions: [
        FlatButton.icon(onPressed: () async{
           await auth.SignOut();
          Navigator.of(context).push( MaterialPageRoute(builder: (context) => LoginScreen()));
        }, icon: Icon(Icons.logout,
        
       ), label: Text("Logout"),
       )
      ],
      ),
      body: Column(
        
        children: [
          SizedBox(height: 10,),
         
            
             GestureDetector(
                onTap: (){
                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Texting()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.black54,
                child: Text("Naga"),),
              ),
            //  Flexible(child: DetailsPage())
            
        ],
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
color: Colors.blue,
        ),
        child: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddingPersons()));
        }, icon: Icon(Icons.add,color: Colors.white,))),
    )
    ;
  }
}