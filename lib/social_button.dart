import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
        IconButton(onPressed: () {}, icon: Icon(Icons.email)),
        IconButton(onPressed: () {}, icon: Icon(Icons.account_box))
      ],
    );
  }
}
