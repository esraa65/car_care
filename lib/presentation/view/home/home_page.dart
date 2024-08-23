import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: Column(
              children: [Text('home Screen')],
            )));
  }
}

