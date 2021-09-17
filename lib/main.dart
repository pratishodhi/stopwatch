import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool startIsPressed = true;
  bool stopIsPressed = true;
  bool resetIsPressed = true;

  String initialTime = "00:00:00";
  String milliseconds = "00";
  var swatch = Stopwatch();
  final dur = const Duration(milliseconds: 100);

  void startTimer() {
    Timer(dur, running);
  }

  void running() {
    if (swatch.isRunning) {
      startTimer();
    }
    setState(() {
      initialTime = swatch.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          ((swatch.elapsed.inMinutes % 60).toString()).padLeft(2, "0") +
          ":" +
          ((swatch.elapsed.inSeconds % 60).toString()).padLeft(2, "0");

      milliseconds =
          ((swatch.elapsed.inMilliseconds % 10).toString()).padLeft(2, "0");
    });
  }

  void stopwatchStart() {
    setState(() {
      startIsPressed = false;
      stopIsPressed = false;
    });
    swatch.start();
    startTimer();
  }

  void stopwatchStop() {
    setState(() {
      stopIsPressed = !stopIsPressed;
      resetIsPressed = false;
      startIsPressed = true;
    });
    swatch.stop();
  }

  void stopwatchReset() {
    setState(() {
      startIsPressed = true;
      resetIsPressed = !resetIsPressed;
    });
    swatch.reset();
    initialTime = "00:00:00";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  initialTime,
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ))),
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  milliseconds,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 152,
                      fontWeight: FontWeight.bold),
                ))),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: stopIsPressed ? null : stopwatchStop,
                    child: const Text("Stop"),
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(100, 50)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                  ),
                  ElevatedButton(
                    onPressed: resetIsPressed ? null : stopwatchReset,
                    child: const Text("Reset"),
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(100, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.orangeAccent)),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: startIsPressed ? stopwatchStart : null,
              child: const Text("Start"),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.greenAccent)),
            ),
            const SizedBox(
              height: 150,
            )
          ],
        )),
      ),
    );
  }
}
