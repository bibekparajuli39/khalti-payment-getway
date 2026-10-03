import 'package:flutter/material.dart';

class AlignAnimation extends StatefulWidget {
  const AlignAnimation({super.key});

  @override
  State<AlignAnimation> createState() => _AlignAnimationState();
}

class _AlignAnimationState extends State<AlignAnimation> {
  bool isleft = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alignment')),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            child: AnimatedAlign(
              alignment: isleft ? .centerLeft : .center,
              duration: Duration(seconds: 3),
              curve: Curves.bounceInOut,
              child: Container(
                alignment: .center,
                height: 100,
                width: 50,
                decoration: BoxDecoration(color: Colors.green),
                child: Text('Bibek'),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isleft = !isleft;
              });
            },
            child: Text('Move Bibek'),
          ),
        ],
      ),
    );
  }
}
