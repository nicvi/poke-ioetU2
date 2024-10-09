import 'dart:async';
import 'package:flutter/material.dart';
import 'package:poke_u2/widgets/pages/homePage.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 0);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/plain-white.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/pokemon-logo-transparent.png"),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              const Text(
                'Loading',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: 100,
                appearance: CircularSliderAppearance(
                  infoProperties: InfoProperties(
                      mainLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                      )),
                  customColors: CustomSliderColors(
                      dotColor: Colors.black,
                      progressBarColor: Colors.black,
                      shadowColor: Colors.white,
                      trackColor: Colors.black),
                  spinnerDuration: 2,
                  animDurationMultiplier: 1.22,
                  animationEnabled: true,
                  startAngle: 0.0,
                  angleRange: 360,
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          )),
    );
  }
}
