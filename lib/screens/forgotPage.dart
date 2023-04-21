// ignore_for_file: file_names, use_build_context_synchronously


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lot_of_practice/components/myButton.dart';
import 'package:lot_of_practice/components/myTextField.dart';

class ForgotMessagePage extends StatefulWidget {
  ForgotMessagePage({super.key});

  @override
  State<ForgotMessagePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgotMessagePage> {
  final textStyle = TextStyle(color: Colors.grey.shade800, fontSize: 18);

  final TextEditingController email = TextEditingController();

  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void sendMessage() async {
    var data = formGlobalKey.currentState;
    if (data!.validate()) {
      if (email.text.isNotEmpty) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Password reset'),
              content: Text(
                  'follow the link, that was sended to your mail ${email.text}'),
              actions: [
                MyButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Return',
                )
              ],
            );
          },
        );
        //Navigator.pop(context);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Ooops'),
              content: const Text("something goes wrong"),
              actions: [
                MyButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    buttonText: "Return")
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const double containerSize = 500;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formGlobalKey,
          child: Center(
            child: Container(
              width: containerSize,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 70),
                  const Icon(Icons.mail_outline, size: 70),
                  const SizedBox(height: 30),
                  Text(
                    'Ooops, do not worry, Reset your password via mail.',
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
                  MyButton(
                    onTap: sendMessage,
                    buttonText: 'Send',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
