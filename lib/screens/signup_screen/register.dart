import 'package:flutter/material.dart';
import 'package:kiosk/widgets/login_widgets/inputfield.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0XFFEEF2F7),
        body: Padding(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 180, top: 30),
          child: Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          hint: "Name",
                          horLen: 10,
                        ),
                      ),
                      Expanded(
                        child: InputField(
                          hint: "Surname",
                          horLen: 10,
                        ),
                      )
                    ],
                  ),
                  InputField(
                    hint: "Email",
                    horLen: 10,
                    keyboard: TextInputType.emailAddress,
                  ),
                  InputField(
                    hint: "Phone Number",
                    horLen: 10,
                    keyboard: TextInputType.phone,
                  ),
                  InputField(
                    hint: "Password",
                    horLen: 10,
                    iconVisible: true,
                  ),
                  InputField(
                    hint: "Confirm Password",
                    horLen: 10,
                    iconVisible: true,
                  ),
                  GestureDetector(
                    onTap: () => print("Log in button pressed"),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFF35D4C0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
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
