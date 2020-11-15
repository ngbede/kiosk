import 'package:flutter/material.dart';
import 'package:kiosk/widgets/login_widgets/inputfield.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              hint: "Email/Phone Number",
              keyboard: TextInputType.emailAddress,
            ),
            InputField(
              hint: "Password",
              iconVisible: true,
            ),
            GestureDetector(
              onTap: () => print("Log in button pressed"),
              child: Card(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                elevation: 10,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New User?",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                GestureDetector(
                  onTap: () => print("Navigate to sign up screen"),
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(height: 110),
          ],
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
