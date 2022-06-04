// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// class Chats extends StatefulWidget {
//   final String chatUserId;
//   Chats({required this.chatUserId});
//   @override
//   _ChatState createState() => _ChatState(
//     chatUserId:this.chatUserId,
//   );
// }

// class _ChatState extends State<Chats> {
//   TextEditingController chatController = TextEditingController();

//   Future<QuerySnapshot> chatUsers;
//   final String chatUserId;
//   _ChatState({required this.chatUserId}) {
//     // TODO: implement 
//     throw UnimplementedError();
//   }
//   @override
//   Widget build(BuildContext context) {
//     setState(() {
//       chatUsers = usersRef.getDocuments();
//     });
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: ,
//       body:FutureBuilder(
//       future: chatUsers,
//       builder: (context,snapshot){
//         if(snapshot.hasData){
//         List<ChatResult> results = [];
      
//         snapshot.data?.docs.forEach((doc){
//         User user = User.fromDocument(doc);
        
//         //check here if the uid of user is != chatUserId
//         //if it is not,(meaning it is not the currently logged in user) add 
//         //him to results
//         if(user.uid != chatUserId.uid){
//         ChatResult result = ChatResult(user);
//         results.add(result);
//         }
//         });
//         return ListView(
//             children: results,
//         );
//       }
//     //  return circularProgress();
//       }
//       ),
//     );
//   }
// }

     

// class ChatResult extends StatelessWidget {
//   final User user;
//   ChatResult(this.user);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color:Colors.white,
//       child: Column(
//         children: <Widget>[
//            GestureDetector(
//             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(
//             username: user.displayName,
//             uuid: Uuid().v4().toString()))),
//             child:
//             ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.grey,
//               //  backgroundImage: CachedNetworkImageProvider(user.photoUrl),
//               ),
//               title: Text(user.displayName,style: TextStyle(fontWeight: FontWeight.bold),),
//               subtitle: Text('message'),
//               ),
//            ),
//           Divider(
//             height: 2.0,
//             color: Colors.black,
//           ),
//         ],
//       ),
//     );
//   }
// }