import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class homePage extends StatefulWidget {

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: Column(
          children: [
            SizedBox(height: 200,),
            Center(
              child: Text("Nais Home Page",style: TextStyle(fontSize: 50)),
            ),
            SizedBox(height: 200,),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    fixedSize: Size(300, 55),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
