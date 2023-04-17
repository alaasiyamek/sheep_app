import 'package:flutter/material.dart';

class UnsupportedFormatBox extends StatelessWidget {
  const UnsupportedFormatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          'Unsupported File Format',
          textAlign: TextAlign.center,
        ),
      ),
      content: const Text(
        'Allowed Formats are PNG, JPG & JPEG',
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
