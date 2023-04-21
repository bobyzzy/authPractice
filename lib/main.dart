import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lot_of_practice/firebase_options.dart';

import 'landingPage.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: "Anton",
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "Anton",
          ),
        ),
      ),
      home:const LandingPage(),
    );
  }
}
