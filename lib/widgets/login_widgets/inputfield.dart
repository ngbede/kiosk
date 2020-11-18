import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hint;
  final TextInputType keyboard;
  final bool iconVisible;
  final double horLen;
  final double verLen;
  InputField({
    @required this.hint,
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horLen,
        vertical: widget.verLen,
      ),
      child: TextField(
        obscuringCharacter: "*",
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
