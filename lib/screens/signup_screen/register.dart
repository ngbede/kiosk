import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/config/constant.dart';
import 'package:kiosk/providers/onboard/account.dart';
import 'package:kiosk/providers/spin/progress.dart';
import 'package:kiosk/screens/layout.dart';
import 'package:kiosk/widgets/login_widgets/inputfield.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

//TODO:handle email/account already in use exception
//TODO:check if passwords match
//TODO:Refactor sign in method

class Register extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0XFFEEF2F7),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<Spin>(context).getWheel(),
          child: Padding(
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
                            dataField: Field.name,
                            horLen: 10,
                          ),
                        ),
                        Expanded(
                          child: InputField(
                            hint: "Surname",
                            dataField: Field.surName,
                            horLen: 10,
                          ),
                        )
                      ],
                    ),
                    InputField(
                      hint: "Email",
                      dataField: Field.email,
                      horLen: 10,
                      keyboard: TextInputType.emailAddress,
                    ),
                    InputField(
                      hint: "Phone Number",
                      dataField: Field.phone,
                      horLen: 10,
                      keyboard: TextInputType.phone,
                    ),
                    InputField(
                      hint: "Password",
                      dataField: Field.password,
                      horLen: 10,
                      iconVisible: true,
                    ),
                    InputField(
                      hint: "Confirm Password",
                      dataField: Field.password,
                      horLen: 10,
                      iconVisible: true,
                    ),
                    GestureDetector(
                      onTap: () async {
                        print("Sign up button pressed");
                        if (Provider.of<Account>(context, listen: false)
                            .fieldsNotNull()) {
                          Provider.of<Spin>(context, listen: false)
                              .changeWheel();
                          try {
                            final _newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: Provider.of<Account>(context,
                                            listen: false)
                                        .getUser()
                                        .email,
                                    password: Provider.of<Account>(context,
                                            listen: false)
                                        .getUser()
                                        .password);
                            if (_newUser != null) {
                              Provider.of<Spin>(context, listen: false)
                                  .changeWheel();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Layout()));
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFF35D4C0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
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
      ),
    );
  }
}
