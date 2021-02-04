import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget({this.child});
  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo.png.png'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: child,
    );
  }
}
