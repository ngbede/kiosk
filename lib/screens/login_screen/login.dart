import 'package:flutter/material.dart';
import 'package:kiosk/config/constant.dart';
import 'package:kiosk/config/instance.dart';
import 'package:kiosk/providers/onboard/account.dart';
import 'package:kiosk/providers/spin/progress.dart';
import 'package:kiosk/screens/layout.dart';
import 'package:kiosk/widgets/login_widgets/inputfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFEEF2F7),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<Spin>(context).getWheel(),
          child: Column(
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
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 25),
                        ),
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
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forgot Password?",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0XFF35D4C0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Provider.of<Spin>(context, listen: false)
                                .changeWheel();
                            final _login = await auth()
                                .signInWithEmailAndPassword(
                                    email: Provider.of<Account>(context,
                                            listen: false)
                                        .getUser()
                                        .email,
                                    password: Provider.of<Account>(context,
                                            listen: false)
                                        .getUser()
                                        .password);
                            if (_login != null) {
                              Provider.of<Spin>(context, listen: false)
                                  .changeWheel();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Layout()));
                            } else {
                              print("Invalid field");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFF35D4C0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 10),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            GestureDetector(
                              onTap: () {
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
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
