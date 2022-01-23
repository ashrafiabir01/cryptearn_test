import 'package:cryptearn_test/page_choice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MainPage());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pageChange(),
    );
  }
}
