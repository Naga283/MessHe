// ignore_for_file: non_constant_identifier_names

import 'package:chattingappli/Screens/Authentication/user.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Authentication{
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

 
   //create user object based on firebase user
  Useru? _userFromFirebaseUser(User? user) {
    return user != null ? Useru(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Useru?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future SignOut() async{
    try{
      
      return await _firebaseAuth.signOut();
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}