import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splitwise/app/views/routes/route.dart';
import 'package:splitwise/app/views/themes/theme.dart';

class SplitWise extends StatelessWidget {
  const SplitWise({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
    ]);
    return MaterialApp.router(
      routerConfig: routes,
      theme: splitwiseTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}