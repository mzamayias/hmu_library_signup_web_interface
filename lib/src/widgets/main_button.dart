import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String string;

  const MainButton({
    Key? key,
    this.onPressed,
    required this.string,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 27, vertical: 9),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        ),
        elevation: MaterialStateProperty.all<double>(
          18,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFF1A4859),
        ),
      ),
      child: Text(string),
    );
  }
}
