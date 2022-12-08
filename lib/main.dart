import 'package:flutter/material.dart';
import 'util/flashlight.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlashLightScreen(),
    );
  }
}

class FlashLightScreen extends StatefulWidget {
  const FlashLightScreen({super.key});

  @override
  State<FlashLightScreen> createState() => _FlashLightScreenState();
}

class _FlashLightScreenState extends State<FlashLightScreen> {
  bool hasFlashlight = false;

  @override
  initState() {
    super.initState();
    switchFlashlight();
  }

  switchFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      hasFlashlight = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(hasFlashlight
              ? 'Your phone has a Flashlight.'
              : 'Your phone has no Flashlight.'),
          IconButton(
            icon: Icon(
              hasFlashlight ? Icons.flash_on : Icons.flash_off,
              color: Colors.grey,
              size: 40.0,
            ),
            onPressed: () =>
                hasFlashlight ? Flashlight.lightOn() : Flashlight.lightOff(),
          ),
        ],
      )),
    );
  }
}
