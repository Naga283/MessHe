

// ignore_for_file: prefer_const_constructors

import 'package:chattingappli/Screens/phoneAuth/detailsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../homePage.dart';
import 'NewHomeScreen.dart';

class InitialiserWidget extends StatefulWidget {
  @override
  _InitialiserWidgetState createState() => _InitialiserWidgetState();
}

class _InitialiserWidgetState extends State<InitialiserWidget> {
  late FirebaseAuth _auth;
  late User _user;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser!;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? LoginScreen()
            : HomePage();
  }
}
