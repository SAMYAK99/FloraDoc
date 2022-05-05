import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:sih/Screens/CameraScreen/CameraDetection.dart';
import 'package:sih/Screens/FertilizerCalculator.dart';
import 'package:sih/Screens/HowToUse.dart';
import 'package:sih/Screens/ImageHistory.dart';
import 'package:sih/Screens/Intro/IntroScreen.dart';
import 'package:sih/Screens/Profile.dart';
import 'package:sih/Screens/Registration/loginScreen.dart';
import 'drawerItems.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Profile',
                  icon: Icons.person_rounded,
                  onPressed: () => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => ProfilePage()))
                      }),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'Fertilizer Calculator',
                  icon: Icons.account_box_rounded,
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FertilizerCalculator())),
                      }),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'Diseases Information',
                  icon: Icons.medical_services,
                  onPressed: () => onItemPressed(context, index: 3)),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'How to Use',
                  icon: Icons.info,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => HowToUsePage()));
                  }),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'Settings',
                  icon: Icons.settings,
                  onPressed: () => onItemPressed(context, index: 4)),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'Share Us',
                  icon: Icons.share,
                  onPressed: () => share()),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'Report a Bug ! ',
                  icon: Icons.bug_report,
                  onPressed: () => onItemPressed(context, index: 4)),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage())),
                      })
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ImageHistory()));
        break;
    }
  }

  Widget headerWidget() {
    const url = 'assets/pro.jpg';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(url),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Prince Singh',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text('prince22@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }
}

Future<void> share() async {
  await FlutterShare.share(
      title: 'Flora Doc+',
      text: 'Download the Flora Doc+ now \n 👇👇👇👇👇\n',
      linkUrl:
          'https://play.google.com/store/apps/details?id=com.trending.game.tic_tac_toe',
      chooserTitle: 'Share Flora Doc+');
}
