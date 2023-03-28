import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_login/constant.dart';
import 'package:flutter_animation_login/loginForm.dart';
import 'package:flutter_animation_login/signupForm.dart';
import 'package:flutter_animation_login/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    setUpAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //it provide screen height and width
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                //login
                AnimatedPositioned(
                  duration: defaultDuration,
                  width: size.width * 0.88,
                  height: size.height,
                  left: _isShowSignUp ? -size.width * 0.76 : size.width * 0,
                  child: Container(
                    // color: login_bg,
                    child: LoginForm(),
                  ),
                ),
                //signup
                AnimatedPositioned(
                  duration: defaultDuration,
                  height: size.height,
                  width: size.width * 0.95,
                  left: _isShowSignUp ? size.width * 0.12 : size.width * 0.88,
                  child: Container(
                    // color: signup_bg,
                    child: SignupForm(),
                  ),
                ),
                //circle avatar
                AnimatedPositioned(
                    duration: defaultDuration,
                    top: size.height * 0.1,
                    left: 0,
                    right:
                        _isShowSignUp ? -size.width * 0.06 : size.width * 0.06,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white10,
                      radius: 35,
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    )),
                    //social icon
                AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: size.height * 0.1,
                    right:
                        _isShowSignUp ? -size.width * 0.06 : size.width * 0.06,
                    width: size.width,
                    child: SocialButton()),
                //login text
                AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: _isShowSignUp
                        ? size.height / 2 - 80
                        : size.height * 0.3,
                    left: _isShowSignUp ? 0 : size.width * 0.44 - 80,
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _isShowSignUp ? 20 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                      child: Transform.rotate(
                        angle: -_animationTextRotate.value * pi / 180,
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            if (_isShowSignUp) {
                              updateView();
                            } else {
                              //Log in
                            }
                          },
                          child: Container(
                            width: 160,
                            child: Text(
                              'Log in'.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    )),
                //sign up text
                AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: !_isShowSignUp
                        ? size.height / 2 - 80
                        : size.height * 0.3,
                    right: _isShowSignUp ? size.width * 0.44 - 80 : 0,
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: !_isShowSignUp ? 20 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                      child: Transform.rotate(
                        angle: (90 - _animationTextRotate.value) * pi / 180,
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            if (_isShowSignUp) {
                              //sign up
                            } else {
                              updateView();
                            }
                          },
                          child: Container(
                            width: 160,
                            child: Text(
                              'Sign up'.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            );
          }),
    );
  }
}
