
import 'package:flutter/material.dart';
import 'package:splitwise/app/views/themes/theme.dart';
import 'package:splitwise/app/views/widgets/custom_painter.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double size = constraints.maxWidth * 0.23;
        double avatarRadius = size * 0.45;
        double fontSize = size * 0.45; 

        return Column(
          children: [
            SizedBox(
              height: size,
              width: size,
              child: CustomPaint(
                painter: AvatarPainter(),
                child: Center(
                  child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Colors.white,
                    child: Text(
                      'M',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColorScheme.largeTextColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Meha Bakliwal',
              style: TextStyle(
                fontSize: size * 0.2,
                fontWeight: FontWeight.bold,
                color: AppColorScheme.primary, 
              ),
            ),
          ],
        );
      },
    );
  }
}


