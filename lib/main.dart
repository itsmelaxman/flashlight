import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  bool flashlight_on = true;

  void _switchFlashlight() {
    setState(() {
      flashlight_on = !flashlight_on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: _switchFlashlight,
          child: Container(
              color: flashlight_on ? Colors.white : Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          flashlight_on ? Icons.flash_on : Icons.flash_off,
                          color: Colors.grey,
                          size: 40.0,
                        ),
                        onPressed: null)
                  ],
                ),
              ))),
    );
  }
}
