import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splitwise/app/views/themes/theme.dart';

class MyPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size){
    final Paint paint = Paint();
    paint.color = AppColorScheme.secondary;
    
    Offset centre = Offset(size.width* 0.5, size.height * 0.059375);

    canvas.drawCircle(centre, size.height * 0.3515625, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return oldDelegate != this; 
  }
}

class AvatarPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size){
      final Paint paint = Paint()
     ..isAntiAlias = true
     ..strokeWidth = 3.0
     ..style = PaintingStyle.fill;


   final double mainCircleDiameter = size.width;

   final arcsRect = Rect.fromLTWH(0, 0, mainCircleDiameter, mainCircleDiameter);
   final useCenter = true;


   List<Color> sectorColors = [
      AppColorScheme.green,
      AppColorScheme.red
   ];


   const double sweepAngle = pi;
   double startAngle = pi * 0.5;
   for(Color color in sectorColors) {
     canvas.drawArc(arcsRect, startAngle, sweepAngle, useCenter,
       paint..color = color);
     startAngle = startAngle + sweepAngle;
   }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return oldDelegate != this; 
  }
}