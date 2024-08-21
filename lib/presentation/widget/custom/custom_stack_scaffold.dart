import 'package:flutter/material.dart';

class CustomStackScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final String backgroundImagePath;
  final Widget? bottomNavBar;
  const CustomStackScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    required this.backgroundImagePath,
    this.bottomNavBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            backgroundImagePath,
            colorBlendMode: BlendMode.srcIn,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            appBar: appBar,
            backgroundColor: Colors.transparent,
            bottomNavigationBar: bottomNavBar,
            body: body,
            // ),
            floatingActionButton: floatingActionButton,
          )
        ],
      ),
    );
  }
}
