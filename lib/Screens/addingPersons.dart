import 'package:chattingappli/Screens/phoneAuth/detailsPage.dart';
import 'package:chattingappli/Screens/texting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AddingPersons extends StatelessWidget {
  const AddingPersons({ Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usrId;
    var UserName;
    var currUserr;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(title: Text("Adding Persons"),),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
        return ListView.builder(
          itemCount:snapshot.hasData?snapshot.data!.docs.length:0,
          itemBuilder: (_,index){
return GestureDetector(
  onTap: (){
    print("${snapshot.data!.docs[index]["UserId"]}");
usrId = snapshot.data!.docs[index]["UserId"];
UserName = snapshot.data!.docs[index]["Name"];
currUserr = firebaseUser?.uid;
print(usrId);
print(UserName);
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Texting(UserDataId: usrId.toString(), UserNames: UserName.toString(), currUser: currUserr,)));
  },
  child:   Container(
  
    child: Card(child: Text("${snapshot.data!.docs[index]["Name"]}",style: TextStyle(fontSize: 30),)),
  
  ),
);

        });
     
     
      },)
    );
  }
}