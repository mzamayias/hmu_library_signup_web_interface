import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class YellowTextFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController textEditingController;
  bool isPassword;
  String? previousPassword;

  YellowTextFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
    this.isPassword = false,
    confirmPassword,
  }) : super(key: key);

  @override
  _YellowTextFormFieldState createState() => _YellowTextFormFieldState();
}

class _YellowTextFormFieldState extends State<YellowTextFormField> {
  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 300,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        // obscureText: widget.labelText == 'Password' ? true : false,
        controller: widget.textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onFieldSubmitted: (_) {
          String errorMessage;
          if (widget.isPassword) {
            if (widget.previousPassword != null) {
              errorMessage = validateConfirmPassword(
                  widget.textEditingController.text, widget.previousPassword!);
            } else {
              errorMessage = validatePassword(widget.textEditingController.text);
            }
          } else {
            errorMessage = validateEmail(widget.textEditingController.text);
          }
          if (errorMessage != 'success') {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'Invalid ${widget.labelText}',
                  style: const TextStyle(
                    color: Color(0xFF1A4859),
                  ),
                ),
                content: Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Color(0xFF1A4859),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            );
          }
        },
        validator: (value) {
          if (widget.isPassword & (widget.previousPassword == null)) {
            (value) {
              if (validatePassword(value!) != 'success') {
                return validatePassword(value);
              }
            };
          } else if (widget.isPassword & (widget.previousPassword != null)) {
            (value) {
              if (validateConfirmPassword(value!, widget.previousPassword!) !=
                  'success') {
                return validateConfirmPassword(value, widget.previousPassword!);
              }
            };
          } else {
            if (validateEmail(value!) != 'success') {
              return validateEmail(value);
            }
          }
        },
        cursorColor: const Color(0xFFA9915D),
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: '${widget.labelText}*',
          floatingLabelStyle: const TextStyle(
            color: Color(0xFFA9915D),
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
          isDense: true,
          errorMaxLines: 1,
          errorText: null,
          errorStyle: const TextStyle(
            color: Colors.transparent,
            fontSize: 0,
          ),
          alignLabelWithHint: true,
          focusColor: const Color(0xFFA9915D),
          labelStyle: const TextStyle(
            color: Color(0xFF1A4859),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA9915D),
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(21)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA9915D),
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(21)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA9915D),
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(21)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade700,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(21)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade700,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(21)),
          ),
        ),
      ),
    );
  }
}

String validateEmail(String email) {
  if (email.isEmpty) {
    return 'Email is required';
  }
  if (!EmailValidator.validate(email)) {
    return 'Please enter a valid email';
  }
  return 'success';
}

String validatePassword(String password) {
  if (password.isEmpty) {
    return 'Password is required';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters long.';
  }
  RegExp regex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$',
  );
  if (!regex.hasMatch(password)) {
    return '''Password must have at least one
uppercase letter, one lowercase 
letter, and one number.''';
  }
  return 'success';
}

String validateConfirmPassword(String password, String confirmPassword) {
  if (confirmPassword.isEmpty) {
    return 'Confirm password is required';
  }
  if (password != confirmPassword) {
    return 'Passwords do not match.';
  }
  return 'success';
}