import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/widgets/custom_painter.dart';
import 'package:splitwise/app/views/screens/auth/components/login_container.dart';
import 'package:splitwise/app/views/widgets/login_google_facebook.dart';
import 'package:splitwise/app/views/screens/auth/components/signup_container.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
    required this.isLoginScreen
    });

  final bool isLoginScreen;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late String _displayScreenText;
  late String _displayNonScreenText;

  void _setdisplayText(){
    _displayScreenText = widget.isLoginScreen? "LOGIN" : "SIGN UP";
    _displayNonScreenText = widget.isLoginScreen? "SIGN UP" : "LOGIN";
  }

  @override
  void initState() {
    _setdisplayText();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
        child: CustomPaint(
          painter: MyPainter(),
          child: Column(
            children: [
              //SizedBox(height: height * 0.078125),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [           
                    SizedBox(
                      height: height * 0.0703125,
                      width: width * 0.125,
                      child: Image.asset('lib/assets/logo/splitwise_logo.png'),
                    ),
                    SizedBox(width: width * 0.125,),
                    Text('SPLITWISE', style: Theme.of(context).textTheme.headlineLarge,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [  
                    Text(_displayScreenText,
                        style: Theme.of(context).textTheme.headlineLarge),
                    GestureDetector(
                      onTap: (){
                          setState(() {
                            widget.isLoginScreen != widget.isLoginScreen;
                          });
                          widget.isLoginScreen ? context.goNamed("Sign up"): context.goNamed("Login");
                         },
                      child: Text(_displayNonScreenText,
                          style: Theme.of(context).textTheme.headlineSmall,),
                    ),               
                  ],
                ),
              ),
              widget.isLoginScreen? const LoginContainer() : const SignUpContainer(),
              LoginGoogleFacebook(width: width, height: height)
            ],
          ),
        ),
      ),
    );
  }
}
