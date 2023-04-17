import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class TypeClassificationController extends ChangeNotifier {
  String? animalType;
  String? breed;
  int? confidence;

  Future<void> classifyType(String imagePath) async {
    animalType = null;
    notifyListeners();
    loadTypeModel();
    List<dynamic>? output = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 49,
      imageMean: 20,
      imageStd: 240.0,
    );
    var x = output.toString();

    if (output.toString().contains('sheep')) {
      animalType = 'Sheep';
    } else if (output.toString().contains('goat')) {
      animalType = 'Goat';
    } else {
      animalType = 'error';
    }
    notifyListeners(); //change screen
    Tflite.close();
  }

  void classifyBreed(String imagePath) async {
    breed = null;
    notifyListeners();
    loadBreedModel();
    List<dynamic>? output = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 6,
      imageMean: 250,
      imageStd: 1.0,
    );
    var x = output.toString();
    try {
      confidence =
          (double.parse(x.substring(14, x.indexOf(','))) * 100).toInt();
    } catch (e) {
      confidence = 50;
    }
    try {
      breed = x.substring(x.indexOf('label') + 8, x.indexOf('"}'));
      if (animalType == 'Goat' && breed != "A'ardy") {
        print('here yaa');
        breed = "A'ardy";
      }
    } catch (e) {
      breed = 'error';
    }
    notifyListeners();
    Tflite.close();
  }

  static void loadTypeModel() async {
    await Tflite.loadModel(
      model: "assets/models/animal_type_detector.tflite",
      labels: "assets/models/animal_type_labels.txt",
    );
  }

  static void loadBreedModel() async {
    await Tflite.loadModel(
      model: "assets/models/animal_breed_detector.tflite",
      labels: "assets/models/animal_breed_labels.txt",
    );
  }
}
