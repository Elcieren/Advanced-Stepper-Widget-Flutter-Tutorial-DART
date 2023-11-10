import 'package:flutter/material.dart';
import 'package:stepper_example/stepper_ileri_seviye_ornek.dart';
import 'package:stepper_example/stepper_ornek.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: StepperOrnek(),
    );
  }
}

