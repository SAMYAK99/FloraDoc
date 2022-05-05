import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class ConsultWithDoctor extends StatefulWidget {
  @override
  _ConsultWithDoctorState createState() => _ConsultWithDoctorState();
}

class _ConsultWithDoctorState extends State<ConsultWithDoctor> {
  Future<void> _launched;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _makeContact(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("consult");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          elevation: 0,
          title: Text(
            'Consult with Doctor',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.red),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.lightGreen,
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 5,
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              size: 140,
                            )),
                        Text(
                          'We\'re here for you',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      final Uri params = Uri(
                        scheme: 'mailto',
                        path: 'singhsamyak199@gmail.com',
                      );

                      var url = params.toString();
                      _launched = _makeContact(url);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        'assets/gmail.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email Us',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var whatsappUrl = "whatsapp://send?phone=+91 7017506740";
                      _launched = _makeContact(whatsappUrl);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Image.asset('assets/whats.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Contact us on Whatsapp',
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      String phone = "tel:" + 917017506740.toString();
                      launch(phone);
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/phone.png')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Monday - Friday',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '10 am to 10 pm',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Saturday - Sunday',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '11 am to 9 pm',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
