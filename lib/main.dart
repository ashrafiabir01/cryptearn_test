import 'package:cryptearn_test/homepage.dart';
import 'package:cryptearn_test/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MainPage());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(

        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError){
            Fluttertoast.showToast(msg: "Fuck usasdad");
            return Text("so sad");
          }
          else if (snapshot.hasData) {
            return homePage();
          } else {
            return loginPage();
          }
        },
      ),
    );
  }
}
