import 'package:flutter/material.dart';
import 'package:kiosk/providers/spin/progress.dart';
import 'package:kiosk/screens/login_screen/login.dart';
import 'package:kiosk/screens/signup_screen/register.dart';
import 'package:provider/provider.dart';
import 'package:kiosk/providers/onboard/account.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //async
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//TODO: Design a splash screen
//TODO: Use firebase authentication for user sign in and registration from pub.dev
//TODO: Use shared preferences to keep a user logged in once signed in to their device
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Account>(
          create: (context) => Account(),
        ),
        ChangeNotifierProvider<Spin>(
          create: (context) => Spin(),
        ),
      ],
      child: MaterialApp(
        initialRoute: "login",
        routes: {
          "login": (context) => Login(),
          "register": (context) => Register(),
        },
      ),
    );
  }
}
