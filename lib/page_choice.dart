import 'package:cryptearn_test/homepage.dart';
import 'package:cryptearn_test/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class pageChange extends StatefulWidget {
  const pageChange({Key? key}) : super(key: key);

  @override
  _pageChangeState createState() => _pageChangeState();
}

class _pageChangeState extends State<pageChange> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          Fluttertoast.showToast(msg: "Fuck usasdad");
          return Text("so sad");
        } else if (snapshot.hasData) {
          return homePage();
        } else {
          return loginPage();
        }
      },
    );
  }
}
