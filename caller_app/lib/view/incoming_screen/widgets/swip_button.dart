import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SwipeUpDownDemo(),
    );
  }
}

class SwipeUpDownDemo extends StatefulWidget {
  const SwipeUpDownDemo({super.key});

  @override
  _SwipeUpDownDemoState createState() => _SwipeUpDownDemoState();
}

class _SwipeUpDownDemoState extends State<SwipeUpDownDemo> {
  double _top = 0.0; // Initial position of the button

  void _handleSwipe(DragUpdateDetails details) {
    setState(() {
      // If the button is at the top position, move it down by 20 pixels.
      // If it's at the original position, move it up by 20 pixels.
      // _top = _top == 0.0 ? 20.0 : 0.0;
      _top += 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Animation duration
            curve: Curves.easeInOut, // Animation curve
            margin: EdgeInsets.only(top: _top),
            child: GestureDetector(
              onVerticalDragUpdate: _handleSwipe,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Swipe Me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
