import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smart_shoeherd/controllers/image_controller.dart';
import 'package:smart_shoeherd/screens/result_screen.dart';
import 'package:smart_shoeherd/widgets/boxes/image_box.dart';
import 'package:smart_shoeherd/widgets/sheepold.dart';
import 'package:smart_shoeherd/constants.dart';

import '../controllers/type_classification_controller.dart';

class TeethScreen extends StatelessWidget {
  const TeethScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageController>(
      builder: (context, imageController, child) {
        return Sheepold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              ImageBox(
                image: imageController.teethImage == null
                    ? Image.asset(
                        getImage('teeth'),
                      )
                    : Image.file(
                        File(imageController.teethImage!),
                      ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      getIcon('upload'),
                      width: 40,
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Sheep\'s fron incisor teeth image to detect its age',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please select an option',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 50),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                imageController.captureTeethImage(
                                    context, ImageSource.camera);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    getIcon('camera'),
                                    width: 50,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Camera',
                                    style: TextStyle(
                                      color: red,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                imageController.captureTeethImage(
                                    context, ImageSource.gallery);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    getIcon('gallery'),
                                    width: 45,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Gallery',
                                    style: TextStyle(
                                      color: red,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Consumer<TypeClassificationController>(builder:
                            (context, typeClassificationController, child) {
                          return InkWell(
                            onTap: imageController.sheepImage == null
                                ? null
                                : () {
                                    typeClassificationController
                                        .classifyType(
                                            imageController.sheepImage!)
                                        .then((value) {
                                      typeClassificationController
                                          .classifyBreed(
                                              imageController.sheepImage!);
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ResultScreen(),
                                      ),
                                    );
                                  },
                            child: SvgPicture.asset(
                              getIcon('arrow'),
                              color: imageController.teethImage == null
                                  ? Colors.grey
                                  : Colors.black,
                              width: 50,
                              fit: BoxFit.scaleDown,
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
