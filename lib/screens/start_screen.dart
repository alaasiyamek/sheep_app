import 'package:flutter/material.dart';
import 'package:smart_shoeherd/constants.dart';
import 'package:smart_shoeherd/screens/permissions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFF9F8F7),
                mainClr.withOpacity(1),
                const Color(0xFFC6B596),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: double.infinity),
              FractionallySizedBox(
                widthFactor: .7,
                child: Image.asset(
                  getImage('logo'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(width: double.infinity),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PermissionsScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: const Color(0xFF706D65),
                  ),
                  child: const Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}
