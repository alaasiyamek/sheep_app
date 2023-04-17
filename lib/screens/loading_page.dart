import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shoeherd/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Transform.rotate(
                    angle: pi,
                    child: SvgPicture.asset(
                      getIcon('arrow'),
                      color: Colors.grey,
                      width: 50,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: mainClr,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Give us a moment,\nwe almost know!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: altClr,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30, width: double.infinity),
            CircularProgressIndicator(
              color: altClr,
              strokeWidth: 6.0,
            ),
          ],
        ),
        SizedBox(),
      ],
    );
  }
}
