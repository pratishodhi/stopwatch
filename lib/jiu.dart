import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  int count = 0;

  @override
  void initState() {
    super.initState();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Hello World"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Count $count"),
        ),
      ),
    );
  }
}
