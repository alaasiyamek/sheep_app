import 'package:flutter/material.dart';
import 'package:smart_shoeherd/constants.dart';
import 'package:smart_shoeherd/widgets/boxes/camera_access_box.dart';
import 'package:smart_shoeherd/widgets/boxes/gallery_access_box.dart';

class PermissionsController extends ChangeNotifier {
  late bool cameraAccess, galleryAccess;

  PermissionsController() {
    cameraAccess = prefs.getBool('cameraAccess') ?? false;
    galleryAccess = prefs.getBool('galleryAccess') ?? false;
  }

  void allowCamera() async {
    cameraAccess = true;
    await prefs.setBool('cameraAccess', cameraAccess);
    notifyListeners();
  }

  void allowGallery() async {
    galleryAccess = true;
    await prefs.setBool('galleryAccess', galleryAccess);
    notifyListeners();
  }

  void clearPermissions() async {
    cameraAccess = false;
    galleryAccess = false;
    await prefs.setBool('cameraAccess', cameraAccess);
    await prefs.setBool('galleryAccess', galleryAccess);
    notifyListeners();
  }

  void askCameraPermission(BuildContext context) async {
    // // var status = Permission.camera.status;

    // await Permission.camera.request();
    // if (await Permission.camera.request().isGranted) {
    //   cameraAccess = true;
    //   notifyListeners();
    // }

    showDialog(
      context: context,
      builder: (context) => const CameraAccessBox(),
    );
  }

  void askGalleryPermission(BuildContext context) async {
    // var status = Permission.camera.status;
    // if (await Permission.photos.request().isGranted) {
    //   galleryAccess = true;
    //   notifyListeners();
    // }
    showDialog(
      context: context,
      builder: (context) => const GalleryAccessBox(),
    );
  }
}
