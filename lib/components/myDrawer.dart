import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lot_of_practice/components/myListTile.dart';
import 'package:lot_of_practice/screens/homePage.dart';
import 'package:lot_of_practice/screens/loginPage.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    super.key,
  });

  logOut(context) async {
    final isSignedGoogle = await GoogleSignIn().isSignedIn();
    GoogleSignInAccount? user;
    User? userFire = FirebaseAuth.instance.currentUser;
    if (isSignedGoogle) {
      user = await GoogleSignIn().disconnect();
      if (user == null) {
        FirebaseAuth.instance.signOut();
        print(userFire);
      }
    } else {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final listTileStyle = const TextStyle(color: Colors.black, fontSize: 14);
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: height * .25,
            child:const  DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black87),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          MyListTile(
            icon: Icons.home,
            title: "Home page",
            ontap: () {},
          ),
          MyListTile(
            icon: Icons.shopping_bag_rounded,
            title: "Shopping bag",
            ontap: () {},
          ),
          MyListTile(
            icon: Icons.announcement_rounded,
            title: "FAQ",
            ontap: () {
              print(FirebaseAuth.instance.currentUser.toString());
            },
          ),
          MyListTile(
            icon: Icons.settings,
            title: "Settings",
            ontap: () {
              print(FirebaseAuth.instance.currentUser?.email.toString());
            },
          ),
          MyListTile(
            icon: Icons.logout,
            title: "Log out",
            ontap: () {
              logOut(context);
            },
          ),
          ListTile(
            title: Text('logout'),
          )
        ],
      ),
    );
  }
}
