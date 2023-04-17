import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shoeherd/constants.dart';
import 'package:smart_shoeherd/controllers/permissions_controller.dart';

class CameraAccessBox extends StatelessWidget {
  const CameraAccessBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PermissionsController>(
      builder: (context, permissionsController, child) {
        return AlertDialog(
          title: const Center(
            child: Text(
              '"Smart Shepherd" would like to access the Camera',
              textAlign: TextAlign.center,
            ),
          ),
          content: const Text(
            '"Smart Shepherd" would like to use the Camera for capturing the sheep to recognize its features.',
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  width: 120.0,
                  height: 40.0,
                  child: Center(
                    child: Text(
                      'Don\'t Allow',
                      style: TextStyle(
                        fontSize: 18,
                        color: red,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  permissionsController.allowCamera();
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  width: 120.0,
                  height: 40.0,
                  child: Center(
                    child: Text(
                      'Allow',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
