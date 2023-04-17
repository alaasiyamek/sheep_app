import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_shoeherd/constants.dart';
import 'package:smart_shoeherd/controllers/image_controller.dart';
import 'package:smart_shoeherd/controllers/type_classification_controller.dart';
import 'package:smart_shoeherd/screens/error_page.dart';
import 'package:smart_shoeherd/screens/loading_page.dart';
import 'package:smart_shoeherd/screens/sheep_screen.dart';
import 'package:smart_shoeherd/utils/breeds.dart';
import 'package:smart_shoeherd/widgets/sheepold.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Provider.of<TypeClassificationController>(context).animalType ==
                null
            ? LoadingScreen()
            : Provider.of<TypeClassificationController>(context).animalType ==
                    'error'
                ? ErrorScreen()
                : Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SingleChildScrollView(
                      child: Column(
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
                                    color: Colors.grey,
                                    width: 50,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                    color: mainClr,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Result',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SvgPicture.asset(
                                  getIcon('share'),
                                  height: 25.0,
                                  width: 25.0,
                                  color: grey,
                                  fit: BoxFit.scaleDown,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .3,
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(width: 0.3, color: grey),
                              ),
                            ),
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Positioned(
                                  right: -30,
                                  child: Image.asset(
                                    getImage(Provider.of<
                                                TypeClassificationController>(
                                            context)
                                        .breed!),
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                  ),
                                ),
                                Positioned(
                                  left: 30,
                                  bottom: 40,
                                  child: Text(
                                    'Confidence Score\n${Provider.of<TypeClassificationController>(context).confidence!} %',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: altClr,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .45,
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'Animal: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: Provider.of<
                                                    TypeClassificationController>(
                                                context)
                                            .animalType!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'Breed: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: Provider.of<
                                                    TypeClassificationController>(
                                                context)
                                            .breed!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'Age: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'Price: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'Suitability for sacrifice: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Description: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: breeds[Provider.of<
                                                    TypeClassificationController>(
                                                context)
                                            .breed!],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.rotate(
                                  angle: pi,
                                  child: SvgPicture.asset(
                                    getIcon('guide'),
                                    color: Colors.grey,
                                    width: 30,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Health and Meat Guide',
                                  style: TextStyle(
                                    color: red,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              Provider.of<ImageController>(context,
                                      listen: false)
                                  .initImages();
                              while (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SheepScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.rotate(
                                  angle: pi,
                                  child: SvgPicture.asset(
                                    getIcon('restart'),
                                    color: Colors.grey,
                                    width: 30,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Restart',
                                  style: TextStyle(
                                    color: red,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                  ),
      ),
    );
    //   },
    // );
  }
}
