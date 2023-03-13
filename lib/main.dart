import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ando_chan/ando.dart';
import 'ando_chan/measurement.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController controller;

  late final Animation<double> animation;

  late final ValueNotifier<AnimationStatus> animationStatus;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this)
    ..addStatusListener((status) {
      animationStatus.value = status;
    })
      ..duration = const Duration(milliseconds: 200);

    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    animationStatus = ValueNotifier(controller.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        final width = min(constraint.maxWidth, constraint.maxHeight);
        final height = max(constraint.maxWidth, constraint.maxHeight);

        return AndoChan(measurement: AndoChanMeasurement(width: width, height: height));
      }),
      floatingActionButton: ValueListenableBuilder(
      valueListenable: animationStatus,
        builder: (context, value, child) => ElevatedButton(
          onPressed: () {
            if (value == AnimationStatus.completed ||
                value == AnimationStatus.dismissed) {
              controller.repeat(reverse: true);
            } else {
              controller.reset();
            }
          },
          child: Text(
              value == AnimationStatus.completed ||
                  value == AnimationStatus.dismissed
                  ? 'Start Dancing'
                  : 'Stop Dancing'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


