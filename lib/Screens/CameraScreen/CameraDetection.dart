import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:sih/Screens/CameraScreen/SelfDiagnosis.dart';
import 'package:sih/Screens/CameraScreen/cure.dart';
import 'package:sih/Screens/ConsultationScreen/ConsultWithDoctor.dart';
import 'package:sih/utils/ImageView.dart';
import 'package:sih/utils/navigationDrawer.dart';
import 'package:tflite/tflite.dart';

class CameraDetection extends StatefulWidget {
  @override
  _CameraDetectionState createState() => _CameraDetectionState();
}

class _CameraDetectionState extends State<CameraDetection> {
  final picker = ImagePicker();
  File image;
  String ind = "1";
  List output;
  Image img;

  Widget imge;

  @override
  void initState() {
    loadModel().then((value) {
      setState(() {});
    });
    super.initState();
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/plant_disease_model.tflite',
      labels: 'assets/plant_labels.txt',
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage(ImageSource source) async {
    var chosenImage = await picker.getImage(source: source);
    if (chosenImage == null) return null;

    setState(() {
      image = File(chosenImage.path);
    });

    classifyImage(image);
    convertToBase64(image);
    String base64String = convertToBase64(image);

    final _byteImage = Base64Decoder().convert(base64String);
    imge = Image.memory(_byteImage);
  }

  String convertToBase64(File fileData) {
    print(fileData);
    List<int> imageBytes = fileData.readAsBytesSync();
    print(imageBytes);
    String base64Image = base64Encode(imageBytes);
    print("base64");
    print(base64Image);
    return base64Image;
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  classifyImage(File image) async {
    var tfOutput = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      imageMean: 0,
      imageStd: 255,
      threshold: 0.4,
    );
    print(tfOutput);

    setState(() {
      output = tfOutput;
      print(output);
    });
  }

  void _cancelImage() {
    setState(() {
      image = null;
    });
    Future.delayed(
      Duration.zero,
      () => output = null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    buildBottomPanelButton({
      BuildContext context,
      String text,
      Function onTap,
      double buttonHeight,
      double buttonWidth,
    }) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          splashColor: Theme.of(context).accentColor,
          onTap: onTap,
          child: Container(
            height: buttonHeight,
            width: buttonWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 2,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: 'cascadia',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    // buildBottomPanel({
    //   @required double height,
    //   @required double width,
    // }) {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       SizedBox(height: 16),
    //       Text('Check plant condition using image',
    //           style: TextStyle(
    //             fontFamily: 'cascadia',
    //             fontSize: 16,
    //             fontWeight: FontWeight.bold,
    //             letterSpacing: -0.5,
    //             color: Theme.of(context).accentColor,
    //           )),
    //       SizedBox(height: 16),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           buildBottomPanelButton(
    //             context: context,
    //             text: 'Take a photo',
    //             onTap: () {
    //               pickImage(ImageSource.camera);
    //             },
    //             buttonHeight: height * 0.11,
    //             buttonWidth: width * 0.4,
    //           ),
    //           SizedBox(width: width * 0.02),
    //           buildBottomPanelButton(
    //             context: context,
    //             text: 'Choose from gallery',
    //             onTap: () {
    //               pickImage(ImageSource.gallery);
    //             },
    //             buttonHeight: height * 0.11,
    //             buttonWidth: width * 0.4,
    //           ),
    //         ],
    //       ),
    //       SizedBox(height: height * 0.04),
    //     ],
    //   );
    // }

    buildAnalyzedText(String group, String result) {
      return RichText(
        text: TextSpan(
          text: group,
          style: TextStyle(
            fontSize: 16,
            color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: result.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }

    buildClassifiedColumn() {
      String label;
      List<String> result;
      String plantType;
      String condition;
      double confidence;
      if (output != null && output.isNotEmpty) {
        print(output.toString());
        ind = output.first['index'].toString();
        label = output.first['label'];
        result = label.split(' ');
        confidence = output.first['confidence'] * 100;
        plantType = result[0];
        condition = label.replaceAll('$plantType ', '');
      }

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(34),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildAnalyzedText('Plant Type: ', plantType ?? 'ERROR'),
                        buildAnalyzedText('Condition : ', condition ?? 'ERROR'),
                        buildAnalyzedText(
                          'Confidence: ',
                          '${confidence == null ? 'ERROR' : confidence.ceil().toString()}%',
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -2,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      border: Border.all(color: Theme.of(context).accentColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        'Analysis',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'cascadia',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelfDiagnosis(ind.toString()),
                    ),
                  );
                },
                child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.lightGreen,
                    ),
                    child: Center(child: Text('Self Diagnosis'))),
              ),
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConsultWithDoctor(),
                    ),
                  );
                },
                child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.lightGreen,
                    ),
                    child: Center(child: Text('Consult with Doctor'))),
              ),
            ],
          ),
        ],
      );
    }

    Future<bool> _onBackPressed() {
      return showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                    title: Text(
                      "Exit",
                      style: TextStyle(
                          fontFamily: 'mac',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      "Do you Want to exit the app?",
                      style: TextStyle(
                        fontFamily: 'mac',
                        fontSize: 18.0,
                      ),
                    ),
                    actions: [
                      FlatButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: 'mac',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontFamily: 'mac',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Plant Disease Detector',
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  image == null
                      ? Container(
                          height: 350,
                          child: Lottie.asset(
                            'assets/plan.json',
                            animate: true,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ImageViewPage(image),
                            ));
                          },
                          child: Container(
                            height: 350,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                image,
                                height: height * 0.37,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                  Container(
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildButton(Icon(Icons.add_a_photo_outlined),
                            () => pickImage(ImageSource.camera)),
                        _buildButton(Icon(Icons.image_outlined),
                            () => pickImage(ImageSource.gallery)),
                        _buildButton(
                          Icon(Icons.image_not_supported_outlined),
                          () => _cancelImage(),
                        ),
                      ],
                    ),
                  ),
                  output != null
                      ? buildClassifiedColumn()
                      : Padding(
                          padding: EdgeInsets.all(12),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: ListView(
                                children: const [
                                  ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.lightGreen,
                                        child: Text(
                                          '1',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      title: Text(
                                        'Take/Select a photo of an affected plant by tapping the camera button below',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.lightGreen,
                                      child: Text(
                                        '2',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    title: Text(
                                        'Give it a short while before you can get a suggestion of the disease',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  ListTile(
                                    title: Text(''),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                ],
              ),
              // Spacer(),
              // Container(
              //   //height: height * 0.25,
              //   width: width,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(20),
              //       topRight: Radius.circular(20),
              //     ),
              //   ),
              //   child: buildBottomPanel(height: height, width: width),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildButton(Icon icon, VoidCallback callback) {
  return ClipOval(
    child: Material(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.lightGreenAccent[100],
        child: SizedBox(
          width: 56,
          height: 56,
          child: icon,
        ),
        onTap: callback,
      ),
    ),
  );
}
