import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState
    extends State<AnimatedCrossFadeWidget> {
  bool _showFirst = true;

  void _crossFade() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            sizeCurve: Curves.bounceOut,
            crossFadeState: _showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            ),
            secondChild: Container(
              height: 180,
              width: 180,
              color: Colors.lime,
            ),
          ),
          Positioned.fill(
            child: TextButton(
              onPressed: _crossFade,
              child: const Text(
                'Tap to Fade\nColor & Size',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}