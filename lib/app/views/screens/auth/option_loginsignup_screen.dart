import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/themes/theme.dart';
import 'package:splitwise/app/views/widgets/custom_painter.dart';
import 'package:splitwise/app/views/widgets/login_google_facebook.dart';

class LoginSignupOptionScreen extends StatelessWidget {
  const LoginSignupOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomPaint(
        painter: MyPainter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
            Column(
              children: [
                SizedBox(height: height * 0.078125), 
                SizedBox(
                  height: height * 0.15625,
                  child: Image.asset('lib/assets/logo/splitwise_logo.png'),
                  ),
                SizedBox(height: height * 0.0546875),
                Text("SPLITWISE",
                 style: Theme.of(context).textTheme.headlineLarge,
                 )
              ],
            ),
            SizedBox(height: height * 0.2328125),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    width: width * 0.69444,
                    height: height * 0.078125,
                    child: TextButton(
                      onPressed: (){
                        return context.go('/login');
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(AppColorScheme.tertiary),
                        foregroundColor: WidgetStatePropertyAll(AppColorScheme.primary),
                        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 24)),
                      ), 
                      child: const Text("LOGIN"),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 35),
                  child: SizedBox(
                    width: width * 0.69444,
                    height: height * 0.078125,
                    child: TextButton(
                      onPressed: (){
                        return context.go('/signup');
                      },
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(AppColorScheme.primary),
                        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 24)),
                  
                      ), 
                      child: const Text("SIGN UP"),
                      ),
                  ),
                ),  
                LoginGoogleFacebook(width: width, height: height)
              ],
            ),
          ],
        ),
      )
    );
  }
}
