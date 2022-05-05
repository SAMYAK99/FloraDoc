import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sih/Screens/ConsultationScreen/Consultation.dart';
import 'package:sih/Screens/shop.dart';

import '../utils/navigationDrawer.dart';
import 'CameraScreen/CameraDetection.dart';
import 'ImageHistory.dart';
import 'NewsScreen/News.dart';
import 'Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 2;

// creating all pages
  final consult = Consultation();
  final camera = CameraDetection();
  final shop = ShopScreen();
  final history = ImageHistory();
  final news = HealthNews();

  Widget showPage = new CameraDetection();

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return consult;
      case 1:
        return news;
      case 2:
        return camera;
      case 3:
        return history;
      case 4:
        return shop;
      default:
        return camera;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        //initialIndex : pageIndex,
        color: Colors.lightGreen,
        backgroundColor: Colors.white70,
        buttonBackgroundColor: Colors.lightGreen,
        height: 60,
        items: const [
          Icon(
            Icons.phone_in_talk,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.bolt,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.camera,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.history_edu_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person_rounded,
            size: 30,
            color: Colors.white,
          ),
        ],
        animationDuration: const Duration(
          milliseconds: 200,
        ),
        index: 2,
        onTap: (index) {
          setState(() {
            showPage = pageChooser(index);
          });
        },
        animationCurve: Curves.bounceInOut,
      ),
      body: Container(
        child: Center(
          child: showPage,
        ),
      ),
    );
  }
}
