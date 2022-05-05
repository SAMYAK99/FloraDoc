import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sih/Screens/CameraScreen/videos.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cure.dart';

class SelfDiagnosisHindi extends StatefulWidget {
  @override
  _SelfDiagnosisHindiState createState() => _SelfDiagnosisHindiState();
}

class _SelfDiagnosisHindiState extends State<SelfDiagnosisHindi> {
  DiseaseVideo diseaseVideo = DiseaseVideo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                //Text(output[0]['label'].toString()),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        "मक्का मक्का आम जंग",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "अंग्रेजी मे अनुवाद : ",
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          // _speak();
                        },
                        icon: Icon(
                          Icons.language_sharp,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "संभावित लक्षण",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "ब्लाइट का प्रारंभिक लक्षण पत्तियों का तेजी से फैलने वाला, पानी जैसा सड़ांध है, जो जल्द ही ढह जाता है, सिकुड़ जाता है और भूरा हो जाता है। उपयुक्त परिस्थितियों में जब रोगज़नक़ सक्रिय रूप से पत्ती के ऊतकों में फैल रहा होता है, तो घावों के किनारे हल्के हरे दिखाई दे सकते हैं, और पत्तियों के नीचे की तरफ एक महीन सफेद कवक वृद्धि देखी जा सकती है। तनों पर भूरे रंग के घाव विकसित हो सकते हैं ",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "जैविक नियंत्रण",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "रूट चूसने वाले पाउडर फफूंदी द्वारा पसंद किए जाते हैं क्योंकि वे अतिसंवेदनशील पत्ती ऊतक से युक्त होते हैं। रूट चूसने वाले सिंचाई के करीब होते हैं और उच्च आर्द्रता के स्तर संक्रमण की शुरुआत और प्रसार के पक्ष में होते हैं। इसके अतिरिक्त, चंदवा के उद्देश्य से स्प्रे अक्सर जड़ की रक्षा नहीं करते हैं फफूंद इनोकुला को सभी मौसमों में जीवित रहने की अनुमति देने वाले चूसने वाले। चंदवा और फलों के संक्रमण के लिए इस स्रोत को खत्म करने के लिए जड़ चूसने वाले को हटा दें।",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "रासायनिक नियंत्रण",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "फलों पर ख़स्ता फफूंदी के प्रबंधन की कुंजी रोग को पत्तियों से दूर रखना है। अधिकांश सिंथेटिक कवकनाशी निवारक हैं, उन्मूलन नहीं, इसलिए रोग की रोकथाम के बारे में सक्रिय रहें। फसल के माध्यम से गिरने से लगातार कार्यक्रम बनाए रखें। पोस्ट पर विचार करें -फंगस को सर्दी से बचाने के लिए फसल की रोकथाम के उपाय (जैसे सल्फर का प्रयोग, पेड़ों को पत्तियों की वृद्धि के लिए जोर देने से रोकना)",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      var videoUrl =
                          diseaseVideo.returnVideo("Potato Late blight");
                      launch('$videoUrl');
                    },
                    child: Text(
                      'मुझे देखो',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
