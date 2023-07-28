import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "Wallpaper",
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
            children: [
          TextSpan(
              text: "Wala",
              style: TextStyle(
                  color: Colors.red.shade300,
                  fontSize: 22,
                  fontWeight: FontWeight.w800)),
        ]));
  }
}
