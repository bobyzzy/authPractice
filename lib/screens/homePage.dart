// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lot_of_practice/components/myDrawer.dart';
import 'package:lot_of_practice/components/mySlider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  logOut(context) {
    // final isSignedGoogle = await GoogleSignIn().isSignedIn();
    FirebaseAuth.instance.signOut();
    // await FirebaseAuth.instance.signOut();
    //GoogleSignIn().disconnect();
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isSignedGoogle = GoogleSignIn().isSignedIn();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Center(
            child: Text(FirebaseAuth.instance.currentUser.toString()),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: logOut(context),
              child: const Text('Log out'),
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
