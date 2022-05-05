import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sih/Screens/ConsultationScreen/ConsultWithDoctor.dart';
import 'package:sih/utils/API.dart';

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  List data = [
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xff96da45)},
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
  ];

  List imgDoc = [
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk9f7fhlJfQjyHwZ1j4WAYgRRswEgFCc89Lg&usqp=CAU"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPsmZpPjrY6z1TOcvNceAJ7S1FI909NKxkZA&usqp=CAU"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4xdxVILjN9aYnozgR6l5Y3eF6DWxi0Z_l0w&usqp=CAU"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfJouBqNcYhcUb5DA9Hxdhvit-rdY9fz0prA&usqp=CAU"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk9f7fhlJfQjyHwZ1j4WAYgRRswEgFCc89Lg&usqp=CAU"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn-Rme-Dwjyl29g2RtYjlwb2j_-q6lwbyXEw&usqp=CAU"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgut-XrUTj4kq8azPG0BcV3bwfaDrOvAEicg&usqp=CAU"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPsmZpPjrY6z1TOcvNceAJ7S1FI909NKxkZA&usqp=CAU"
    },
  ];

  List doctors = [];

  @override
  void initState() {
    super.initState();
    EasyLoading.show();
    getCourses();
    EasyLoading.dismiss();
  }

  getCourses() async {
    var res = await APIService.getReq(APIService.doctorsData);
    // print(res);
    setState(() {
      doctors = res['data'];
    });
    print("----------------");
    print(doctors);

    // tempCourse = courses;
  }

  final colorwhite = Colors.white;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: doctors.length > 0
          ? GridView.builder(
              itemCount: 7,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConsultWithDoctor(),
                        ),
                      );
                    },
                    child: Card(
                        color: data[index]["color"],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: width * 0.38,
                          height: height * 0.26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                                imgDoc[index]["img"])),
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
                                              doctors[index]["name"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            fit: BoxFit.fitWidth,
                                          ),
                                          FittedBox(
                                            child: Text(
                                              "ratings: 2",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            fit: BoxFit.fitWidth,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Experince: ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                "2",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              color: Colors.grey),
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
                                              borderRadius:
                                                  BorderRadius.circular(90),
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
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              color: Colors.red),
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
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'Please Wait',
                style: TextStyle(fontSize: 40, color: Colors.green),
              ),
            ),
    );
  }
}
