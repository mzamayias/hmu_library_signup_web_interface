import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String string;

  const SecondaryButton({
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
          const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        ),
        elevation: MaterialStateProperty.all<double>(
          18,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFFFFFFFF),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Color(0xFF1A4859),
            width: 2,
          ),
        ),
      ),
      child: Text(
        string,
        style: const TextStyle(
          color: Color(0xFF1A4859),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
