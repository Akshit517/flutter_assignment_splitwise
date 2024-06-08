import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginGoogleFacebook extends StatelessWidget {
  const LoginGoogleFacebook({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: width * 0.29,
          height: height * 0.078125,
          child: TextButton(
            onPressed: (){
              context.goNamed("Home");
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(241, 237, 237, 1)),
            ),
            child: Image.asset('lib/assets/icons/google.png'),
          ),
        ),
        SizedBox(
          width: width * 0.29,
          height: height * 0.078125,
          child: TextButton(
            onPressed: (){},
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(21, 125, 195, 1)),
            ),
            child: Image.asset('lib/assets/icons/facebook.png')
          )
        )  
      ],
    );
  }
}