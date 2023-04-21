// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lot_of_practice/components/credentialButton.dart';
import 'package:lot_of_practice/components/myButton.dart';
import 'package:lot_of_practice/components/myTextField.dart';
import 'package:lot_of_practice/screens/forgotPage.dart';

import 'homePage.dart';
import 'signUpPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textStyle = TextStyle(color: Colors.grey.shade800, fontSize: 18);

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  void logIn(context) async {
    var formData = formGlobalKey.currentState;
    if (formData!.validate()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } else {
      return null;
    }
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return HomePage();
  }

  @override
  Widget build(BuildContext context) {
    const double containerSize = 500;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formGlobalKey,
            child: Center(
              child: Container(
                width: containerSize,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 70),
                    const Icon(Icons.lock, size: 70),
                    const SizedBox(height: 100),
                    Text(
                      'Welcome to our app. Please Sign in now!',
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                    const SizedBox(height: 30),
                    MyTextField(
                      controller: email,
                      inputType: TextInputType.emailAddress,
                      label: "E-mail",
                      hintText: "example@gmail.com",
                      helperText: 'Please enter your e-mail',
                      isObscure: false,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'form is empty';
                        } else if (!email.contains('@')) {
                          return 'mail must be with @ character';
                        } else if (!email.contains('.')) {
                          return 'you forgot a  \' . \' charcter';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    MyTextField(
                      controller: password,
                      inputType: TextInputType.visiblePassword,
                      label: "Password",
                      hintText: "",
                      helperText: 'password must be at least 8 characters ',
                      isObscure: true,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'form is empty';
                        } else if (p0.length < 8) {
                          return 'password must be less than 8 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotMessagePage()));
                        },
                        child: const Text('forgot password?'),
                      ),
                    ),
                    const SizedBox(height: 50),
                    MyButton(
                      buttonText: "Log in ",
                      onTap: () => logIn(context),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CredButton(
                          onTap: () {
                            signInWithGoogle();
                          },
                          imageAsset: 'google.png',
                        ),
                        const SizedBox(width: 30),
                        CredButton(
                          onTap: () {},
                          imageAsset: 'apple.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('do not have account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInPage(),
                                  ));
                            },
                            child: const Text('Register now')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
