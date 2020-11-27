import 'package:flutter/material.dart';
import 'package:kiosk/config/constant.dart';
import 'package:kiosk/config/instance.dart';
import 'package:kiosk/providers/onboard/account.dart';
import 'package:kiosk/providers/spin/progress.dart';
import 'package:kiosk/screens/layout.dart';
import 'package:kiosk/widgets/login_widgets/inputfield.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

//TODO:handle email/account already in use exception
class Register extends StatelessWidget {
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
                EdgeInsets.only(left: 15.0, right: 15.0, bottom: 120, top: 30),
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Create Account",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Divider(),
                    InputField(
                      hint: "First Name",
                      dataField: Field.name,
                      horLen: 10,
                    ),
                    InputField(
                      hint: "Last Name",
                      dataField: Field.surName,
                      horLen: 10,
                    ),
                    InputField(
                      hint: "Email Address",
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
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Passwords must be at least 6 characters.",
                        style: TextStyle(fontSize: 10),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        print("Sign up button pressed");
                        if (Provider.of<Account>(context, listen: false)
                            .fieldsNotNull()) {
                          Provider.of<Spin>(context, listen: false)
                              .changeWheel();
                          try {
                            final _newUser = await auth()
                                .createUserWithEmailAndPassword(
                                    email: Provider.of<Account>(context,
                                            listen: false)
                                        .getUser()
                                        .email,
                                    password: Provider.of<Account>(context,
                                            listen: false)
                                        .getUser()
                                        .password);
                            //For every new user store their additional info in cloud firestore
                            store().collection("users").add(
                              {
                                "email":
                                    Provider.of<Account>(context, listen: false)
                                        .getUser()
                                        .email,
                                "id": _newUser.user.uid,
                                "name":
                                    Provider.of<Account>(context, listen: false)
                                        .getUser()
                                        .name,
                                "surname":
                                    Provider.of<Account>(context, listen: false)
                                        .getUser()
                                        .surName,
                                "phoneNumber":
                                    Provider.of<Account>(context, listen: false)
                                        .getUser()
                                        .phoneNumber
                              },
                            );
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
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Text(
                            "Create Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "By signing up you accept our terms and conditions & privacy policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0XFFCDD8EA)),
                    )
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
