import 'package:flutter/material.dart';
import 'package:flutter_animation_login/constant.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    final ScreenWidth = ScreenSize.width;
    final ScreenHeight = ScreenSize.height;
    final ClientHeight = ScreenHeight - kToolbarHeight;
    return Scaffold(
      backgroundColor: login_bg,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Spacer(),
          SizedBox(
            width: ScreenWidth * 0.6,
            height: ClientHeight * 0.08,
            child: const TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelText: 'Enter Email',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'i.e usman@....',
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          SizedBox(
            width: ScreenWidth * 0.6,
            height: ClientHeight * 0.08,
            child: const TextField(
              cursorColor: Colors.black,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                  labelText: 'Enter password',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintText: 'i.e 123***....',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ]),
      ),
    );
  }
}
