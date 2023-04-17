import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shoeherd/constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

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
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Text(
                  'Oops .. No animal\nis found!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: altClr,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  getImage('oops'),
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(),
      ],
    );
  }
}
