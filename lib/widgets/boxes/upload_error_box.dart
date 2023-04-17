import 'package:flutter/material.dart';

class UploadErrorBox extends StatelessWidget {
  const UploadErrorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          'Upload Error',
          textAlign: TextAlign.center,
        ),
      ),
      content: const Text(
        'The file is too large\nYou can upload files between\n40KB ~ 120KB in size.',
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const SizedBox(
              width: 150.0,
              height: 40.0,
              child: Center(
                child: Text('OK'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
