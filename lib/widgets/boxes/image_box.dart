import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final Widget image;
  const ImageBox({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: image,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 7,
                    color: Colors.black,
                  ),
                  right: BorderSide(
                    width: 7,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 7,
                    color: Colors.black,
                  ),
                  left: BorderSide(
                    width: 7,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 7,
                    color: Colors.black,
                  ),
                  left: BorderSide(
                    width: 7,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 7,
                    color: Colors.black,
                  ),
                  right: BorderSide(
                    width: 7,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
