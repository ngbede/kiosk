import 'package:flutter/material.dart';
import 'package:kiosk/config/constant.dart';
import 'package:kiosk/widgets/login_widgets/inputfield.dart';

//TODO:implement sign in method with firebase
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFEEF2F7),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 100),
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      InputField(
                        hint: "E-mail",
                        keyboard: TextInputType.emailAddress,
                        dataField: Field.email,
                      ),
                      InputField(
                        hint: "Password",
                        dataField: Field.password,
                        iconVisible: true,
                      ),
                      GestureDetector(
                        onTap: () => print("Log in button pressed"),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0XFF35D4C0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 70, vertical: 15),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
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
                            onTap: () {
                              print("Navigate to sign up screen");
                              Navigator.pushNamed(context, "register");
                            },
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
