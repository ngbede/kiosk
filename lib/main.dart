import 'package:flutter/material.dart';
import 'package:kiosk/screens/login_screen/login.dart';
import 'package:kiosk/screens/signup_screen/register.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() {
  //async
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
  runApp(MyApp());
}

//TODO: Design the login screen
//TODO: Design the registration screen
//TODO: Create a new firebase project with your account
//TODO: Design a splash screen
//TODO: Use firebase authentication for user sign in and registration from pub.dev
//TODO: Use shared preferences to keep a user logged in once signed in to their device
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "login",
      routes: {
        "login": (context) => Login(),
        "register": (context) => Register(),
      },
    );
  }
}
