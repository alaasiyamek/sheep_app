import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_shoeherd/constants.dart';
import 'package:smart_shoeherd/controllers/permissions_controller.dart';
import 'package:smart_shoeherd/screens/sheep_screen.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PermissionsController>(
        builder: (context, permissionsController, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              width: 20,
                              color: const Color(0xFF706D65),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF706D65),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Permissions',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Please, allow us to access the following sheep detection',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        permissionsController.askCameraPermission(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              getIcon('camera'),
                              width: 50,
                              fit: BoxFit.scaleDown,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                'Allow us to access the camera',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            if (permissionsController.cameraAccess)
                              const Icon(
                                Icons.check,
                                size: 30.0,
                                color: Colors.green,
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        permissionsController.askGalleryPermission(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              getIcon('gallery'),
                              width: 50,
                              fit: BoxFit.scaleDown,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                'Allow us to access the gallery',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            if (permissionsController.galleryAccess)
                              const Icon(
                                Icons.check,
                                size: 30.0,
                                color: Colors.green,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (permissionsController.cameraAccess &&
                    permissionsController.galleryAccess)
                  TextButton(
                    onPressed: () async {
                      firstTime = false;
                      await prefs.setBool('firstTime', firstTime);
                      while (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SheepScreen(),
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
    });
  }
}
