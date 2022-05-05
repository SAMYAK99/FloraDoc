import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Home.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              image: Image.asset('assets/intone.png'),
              title: 'Interact with Experts',
              body:
                  'Chat with Experts/Scientists from the app One-to-One via Chat , Video or Call',
            ),
            PageViewModel(
              image: Image.asset('assets/intthree.png'),
              title: 'Daily News',
              body:
                  'Daily News from all the top sources of the app are integerated in the app',
            ),
            PageViewModel(
              image: Image.asset('assets/intfour.png'),
              title: 'AI Recommendation',
              body:
                  'Get AI Recommendation for all your plants with just a single click',
            ),
            PageViewModel(
              image: Image.asset('assets/inttwo.png'),
              title: 'Realtime Chat',
              body: 'Realtime Chat with scientists/Experts',
            ),
          ],
          onDone: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Home()));
          },
          skip: const Icon(Icons.skip_next),
          next: const Icon(Icons.forward),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: const Color(0xFF56ab2f),
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
