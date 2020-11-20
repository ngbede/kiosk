import 'package:flutter/material.dart';
import 'package:kiosk/config/constant.dart';
import 'package:kiosk/providers/onboard/account.dart';
import 'package:provider/provider.dart';

class InputField extends StatefulWidget {
  final String hint;
  final TextInputType keyboard;
  final bool iconVisible;
  final double horLen;
  final double verLen;
  final Field dataField;
  InputField({
    @required this.hint,
    @required this.dataField,
    this.horLen = 20.0,
    this.verLen = 10.0,
    this.iconVisible = false,
    this.keyboard = TextInputType.text,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

bool hidePassword = true;

class _InputFieldState extends State<InputField> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horLen,
        vertical: widget.verLen,
      ),
      child: TextField(
        controller: _controller,
        obscuringCharacter: "*",
        onChanged: (value) {
          if (widget.dataField == Field.name) {
            Provider.of<Account>(context, listen: false).setName(value);
          } else if (widget.dataField == Field.email) {
            Provider.of<Account>(context, listen: false).setEmail(value);
          } else if (widget.dataField == Field.phone) {
            Provider.of<Account>(context, listen: false).setContact(value);
          } else if (widget.dataField == Field.surName) {
            Provider.of<Account>(context, listen: false).setSurname(value);
          } else {
            print("fix password");
          }
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: widget.iconVisible
              ? GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        hidePassword = !hidePassword;
                        print("Hide password: $hidePassword");
                      },
                    );
                  },
                  child: hidePassword
                      ? Icon(
                          Icons.visibility_off_sharp,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_sharp,
                          color: Colors.teal,
                        ),
                )
              : null,
        ),
        keyboardType: widget.keyboard,
        obscureText: widget.iconVisible ? hidePassword : false,
      ),
    );
  }
}
