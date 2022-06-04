import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Texting extends StatelessWidget {
  final String currUser;
  final String UserDataId;
  final String UserNames ;
  const Texting({ Key? key, required this.UserDataId, required this.UserNames, required this.currUser }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     CollectionReference ref =FirebaseFirestore.instance.collection("Messages");
     TextEditingController mess = TextEditingController();
     var firebaseUser = FirebaseAuth.instance.currentUser;
     
    return Scaffold(
appBar: AppBar(title: Text("${UserNames}"),

),
body: StreamBuilder(
  stream:  FirebaseFirestore.instance.collection("Messages").doc(firebaseUser?.uid).collection(UserDataId).snapshots(),
  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return     Column(
     mainAxisSize: MainAxisSize.max,
    
         mainAxisAlignment: MainAxisAlignment.end,
       
      children: [
        
            
          Flexible(
            child: ListView.builder(
           
             itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
            
              itemBuilder: (_,index){
                return Column(
                //  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:[
            
              
            
                  Container(
                    padding: EdgeInsets.only(left: 50,top: 10),
                    margin: EdgeInsets.only(bottom: 10,right: 10),
                   width: MediaQuery.of(context).size.width *0.5,
                   height: 50,
                    decoration:  BoxDecoration(
                       color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text("${snapshot.data!.docs[index]["content"]}")) 
            
              ],
          
            );
            }
          
          ),
        ),
       
          Flexible(child: textFieldWidget(mess: mess, ref: ref, firebaseUser: firebaseUser, UserDataId: UserDataId, currentUser: currUser,)),
       SizedBox(height: 20,)
      ],
    );
  }));
  }
}

class textFieldWidget extends StatelessWidget {
  const textFieldWidget({
    Key? key,
    required this.mess,
    required this.ref,
    required this.firebaseUser, required this.UserDataId, required this.currentUser,
  }) : super(key: key);
  final String currentUser;
final String UserDataId;
  final TextEditingController mess;
  final CollectionReference<Object?> ref;
  final User? firebaseUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
            
         Flexible(
            
          child: TextFormField(
            
            controller: mess,
            
          decoration: InputDecoration(hintText: "Enter Message",
            
           border:OutlineInputBorder(
            
             borderRadius: BorderRadius.circular(30),
            
             borderSide: BorderSide(
            
               width: 60
            
             ),
            
           )
            
          )
            
        
            
              
            
              ),
            
        ),
            
         IconButton(onPressed: (){
            
            ref.doc(firebaseUser?.uid).collection(UserDataId).add({
            
              "content":mess.text,
              "UserTo": UserDataId,
              "UserFrom": currentUser
            
            }
            
              
            
            );
            
         }, icon: const Icon(Icons.send))
            
      ],
            
    );
  }
}