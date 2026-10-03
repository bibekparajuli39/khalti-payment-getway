import 'package:flutter/material.dart';

class AnimatedPaddingScreen extends StatefulWidget {
  const AnimatedPaddingScreen({super.key});

  @override
  State<AnimatedPaddingScreen> createState() => _AnimatedPaddingScreenState();
}

class _AnimatedPaddingScreenState extends State<AnimatedPaddingScreen> {
  bool islarge = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Padding')),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  islarge = !islarge;
                });
              },
              child: AnimatedPadding(
                padding: EdgeInsets.all(islarge ? 40 : 15),
                duration: Duration(seconds: 3),
                curve: Curves.bounceIn,
                child: Container(
                  alignment: .center,
                  decoration: BoxDecoration(color: Colors.blue),
                  height: 100,
                  width: 100,
                  child: Text('Animated Padding'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
