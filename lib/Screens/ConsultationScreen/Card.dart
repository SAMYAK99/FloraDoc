import 'package:flutter/material.dart';
import 'package:sih/utils/API.dart';

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  List data = [
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xff96da45)},
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xff96da45)},
  ];

  // Future<void> getData() async {
  //
  // }
  // // showLoadin(true);
  // var res = await APIService.getReq(url)Req(APIService.revampDashboard, {
  //
  // });

  final colorwhite = Colors.white;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
                color: data[index]["color"],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: width * 0.38,
                  height: height * 0.26,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child:
                                        Image.asset('assets/background.png')),
                                width: width * 0.38,
                                height: height * 0.10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "ratings *",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    fit: BoxFit.fitWidth,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Skills: ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        'Tomato',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: height * 0.09,
                          left: 10,
                          width: 100,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 22.0,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: Colors.lightGreen),
                                  height: 30,
                                  width: 30,
                                ),
                                Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.chat_bubble,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: Colors.green),
                                  height: 30,
                                  width: 30,
                                ),
                                Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.videocam,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: Colors.green),
                                  height: 30,
                                  width: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
