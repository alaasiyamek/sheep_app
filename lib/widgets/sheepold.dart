import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_shoeherd/controllers/permissions_controller.dart';
import 'package:smart_shoeherd/screens/start_screen.dart';
import 'package:smart_shoeherd/constants.dart';

class Sheepold extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Sheepold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PermissionsController>(
      builder: (context, permissionsController, child) {
        return SafeArea(
          child: Scaffold(
            key: _key,
            drawer: Align(
              alignment: Alignment.bottomLeft,
              child: Drawer(
                backgroundColor: const Color(0xFFE5DDD0),
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Image.asset(
                        getImage('logo'),
                      ),
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading: SvgPicture.asset(
                            getIcon('restart'),
                            height: 25.0,
                            width: 25.0,
                            fit: BoxFit.scaleDown,
                          ),
                          title: const Text('Restart'),
                          horizontalTitleGap: 10.0,
                          minVerticalPadding: 0.0,
                          onTap: () async {
                            firstTime = true;
                            await prefs.setBool('firstTime', firstTime);
                            permissionsController.clearPermissions();
                            while (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StartScreen(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            getIcon('guide'),
                            height: 25.0,
                            width: 25.0,
                            fit: BoxFit.scaleDown,
                          ),
                          title: const Text('Health & Meat Guide'),
                          horizontalTitleGap: 10.0,
                          minVerticalPadding: 0.0,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            getIcon('address'),
                            height: 25.0,
                            width: 25.0,
                            fit: BoxFit.scaleDown,
                          ),
                          title: const Text('Support'),
                          horizontalTitleGap: 10.0,
                          minVerticalPadding: 0.0,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            getIcon('share'),
                            height: 25.0,
                            width: 25.0,
                            fit: BoxFit.scaleDown,
                          ),
                          title: const Text('Share App'),
                          horizontalTitleGap: 10.0,
                          minVerticalPadding: 0.0,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    // const SideButtons(),
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                  decoration: BoxDecoration(
                    color: mainClr.withOpacity(0.78),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _key.currentState!.openDrawer();
                        },
                        child: SvgPicture.asset(
                          getIcon('menu'),
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        getImage('logo'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: body,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
