import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hint;
  final TextInputType keyboard;
  final bool iconVisible;
  InputField({
    @required this.hint,
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
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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
