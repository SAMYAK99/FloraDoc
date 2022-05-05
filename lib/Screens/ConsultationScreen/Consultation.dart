import 'package:flutter/material.dart';
import 'package:sih/Screens/ConsultationScreen/DoctorList.dart';
import 'package:sih/utils/navigationDrawer.dart';

import 'Card.dart';

// ignore: camel_case_types
class Consultation extends StatefulWidget {
  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation>
    with SingleTickerProviderStateMixin {
  final colorstheme = Color(0xff4b4b87);

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Consultation',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300]),
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.all(5),
                labelColor: Colors.white,
                unselectedLabelColor: colorstheme,
                labelStyle: TextStyle(fontSize: 20),
                labelPadding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                indicator: BoxDecoration(
                    color: colorstheme,
                    borderRadius: BorderRadius.circular(20)),
                controller: _tabController,
                tabs: [
                  Text('Scientists'),
                  Text('Doctors'),
                  Text('Locals'),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              DoctorList(),
              DoctorList(),
              DoctorList(),
            ]),
          )
        ],
      ),
    );
  }
}
