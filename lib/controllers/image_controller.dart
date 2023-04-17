import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shoeherd/widgets/boxes/unsupported_format_box.dart';
import 'package:smart_shoeherd/widgets/boxes/upload_error_box.dart';
// import 'package:image_picker/image_picker.dart';

class ImageController extends ChangeNotifier {
  late String? sheepImage, teethImage;
  ImageController() {
    initImages();
  }

  initImages() {
    sheepImage = null;
    teethImage = null;
  }

  late final ImagePicker _imagePicker = ImagePicker();

  void captureSheepImage(BuildContext context, ImageSource source) async {
    final result = await _imagePicker.pickImage(
      source: source,
    );
    if (result != null) {
      double size = (await result.readAsBytes()).lengthInBytes / 1024;
      size = size.abs();
      if (size > 10 && size < 10240) {
        if (result.path.toLowerCase().endsWith('.jpg') ||
            result.path.toLowerCase().endsWith('.jpeg') ||
            result.path.toLowerCase().endsWith('.png')) {
          sheepImage = result.path;
          notifyListeners();
        } else {
          showDialog(
            context: context,
            builder: (context) => const UnsupportedFormatBox(),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => const UploadErrorBox(),
        );
      }
    }
  }

  void captureTeethImage(BuildContext context, ImageSource source) async {
    final result = await _imagePicker.pickImage(
      source: source,
    );
    if (result != null) {
      double size = (await result.readAsBytes()).lengthInBytes / 1024;
      size = size.abs();
      if (size > 10 && size < 10240) {
        if (result.path.toLowerCase().endsWith('.jpg') ||
            result.path.toLowerCase().endsWith('.jpeg') ||
            result.path.toLowerCase().endsWith('.png')) {
          teethImage = result.path;
          notifyListeners();
        } else {
          showDialog(
            context: context,
            builder: (context) => const UnsupportedFormatBox(),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => const UploadErrorBox(),
        );
      }
    }
  }
}
