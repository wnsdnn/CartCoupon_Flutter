import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final AppBar? appBar;
  final Widget child;
  final Widget? bottomNav;
  Color color;

  DefaultLayout({super.key, required this.child, this.appBar, this.bottomNav, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: appBar,
      body: SafeArea(child: child),
      bottomNavigationBar: bottomNav,
    );
  }
}
