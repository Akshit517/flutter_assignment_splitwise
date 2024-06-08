import 'package:flutter/material.dart';
import 'package:splitwise/app/views/routes/route.dart';
import 'package:splitwise/app/views/themes/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void init() async {
    await Future.delayed(Duration(seconds: 1));

    routes.go('/option');
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    init();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: height * 0.2,),
                SizedBox(
                  height: height * 0.2,
                  child: Image.asset('lib/assets/logo/splitwise_logo_4x.png')),
                SizedBox(height: height * 0.03),
                Text("SPLITWISE",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppColorScheme.secondary,
                    fontSize: 33
                  )
                  ,)
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Split bills the easy way",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 24,
                  ), 
                ),
                SizedBox(height: height * 0.12,) 
              ],
            ),
          )
        ],
      )
    );
  }
}