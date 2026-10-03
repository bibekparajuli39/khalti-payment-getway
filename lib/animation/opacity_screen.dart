import 'package:flutter/material.dart';

class OpacityScreen extends StatefulWidget {
  const OpacityScreen({super.key});

  @override
  State<OpacityScreen> createState() => _OpacityScreenState();
}

class _OpacityScreenState extends State<OpacityScreen> {
  bool isVisble = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opacity Screen')),
      body: Column(
        children: [
          AnimatedOpacity(
            curve: Curves.easeIn,
            opacity: isVisble ? 1.0 : 0.3,
            duration: Duration(seconds: 2),
            child: AnimatedContainer(
              alignment: .center,
              margin: EdgeInsets.all(11),
              height: isVisble ? 200 : 100,
              width: double.infinity,
              duration: Duration(seconds: 3),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Hello '),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isVisble = !isVisble;
              });
            },
            child: isVisble ? Text('Hide Bibek') : Text('Show Bibek'),
          ),
        ],
      ),
    );
  }
}
