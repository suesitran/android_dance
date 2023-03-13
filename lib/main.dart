import 'dart:async';
import 'dart:math';

import 'package:android_dance/ando_chan/animation/arm_anim.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ando_chan/ando.dart';
import 'ando_chan/animation/anim_definition.dart';
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
      title: 'Ando Dance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController controller;

  late final ValueNotifier<AnimationStatus> animationStatus;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this)
      ..addStatusListener((status) {
        animationStatus.value = status;
      })
      ..duration = const Duration(seconds: durationInSeconds);

    animationStatus = ValueNotifier(controller.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  '${(controller.value * (controller.duration?.inSeconds ?? 0)).toInt()}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ),
            Flexible(child: LayoutBuilder(builder: (context, constraint) {
              final width = min(constraint.maxWidth, constraint.maxHeight);
              final height = max(constraint.maxWidth, constraint.maxHeight);

              controller.value / (controller.duration?.inSeconds ?? 1);
              return AndoChan(
                  measurement:
                      AndoChanMeasurement(width: width, height: height),
                  controller: controller);
            })),
          ],
        ),
      ),
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
          child: Text(value == AnimationStatus.completed ||
                  value == AnimationStatus.dismissed
              ? 'Start Dancing'
              : 'Stop Dancing'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// class TimeTicker extends StatelessWidget {
//   TimeTicker({Key? key}) : super(key: key) {
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       secondsCounter.value--;
//       if (secondsCounter.value == 0) {
//         timer.cancel();
//       }
//     });
//   }
//
//   ValueNotifier<int> secondsCounter = ValueNotifier(durationInSeconds);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(valueListenable: secondsCounter, builder: (context, value, child) => Text('$value', style: Theme.of(context).textTheme.headlineMedium,),);
//   }
// }
