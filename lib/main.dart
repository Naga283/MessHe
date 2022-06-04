// ignore_for_file: prefer_const_constructors

import 'package:chattingappli/Screens/phoneAuth/detailsPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/phoneAuth/NewHomeScreen.dart';
import 'Screens/phoneAuth/startPage.dart';
 void main(List<String> args) async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp(MyApp()); 
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body:InitialiserWidget(),),
    );
  }
}