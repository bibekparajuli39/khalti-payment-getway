import 'package:flutter/material.dart';

class Testanimationcontainer extends StatefulWidget {
  const Testanimationcontainer({super.key});

  @override
  State<Testanimationcontainer> createState() => _TestanimationcontainerState();
}

class _TestanimationcontainerState extends State<Testanimationcontainer> {
  bool isExpended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            AnimatedContainer(
              alignment: .center,
              duration: Duration(seconds: 1),
              curve: Curves.bounceInOut,
              width: isExpended ? 200 : 100,
              height: isExpended ? 200 : 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "HELLO",
                style: TextStyle(
                  color: isExpended ? Colors.white : Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  setState(() {
                    isExpended = !isExpended;
                  });
                });
              },
              child: Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}
