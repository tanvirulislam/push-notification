import 'package:flutter/material.dart';

class OnBackgroundMessage extends StatelessWidget {
  const OnBackgroundMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('On background message'),
      ),
    );
  }
}

class OnScreen extends StatelessWidget {
  const OnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('On screen message'),
      ),
    );
  }
}
