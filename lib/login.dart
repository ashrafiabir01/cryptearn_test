import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text("Firebase Login",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Username",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pass,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  ))),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  fixedSize: Size(300, 55),
                ),
                onPressed: () {
                  signIn();
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                )),
          )
        ],
      )),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: pass.text.trim());
    } catch(e){
      Fluttertoast.showToast(msg: "Fuck u");
    }

  }
}
