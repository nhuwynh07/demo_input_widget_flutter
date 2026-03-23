import 'package:flutter/material.dart';
import 'package:demo_input_widget/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo TextField vs TextFormField',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xFFEE4D2D)),
      home: const DemoScreen(),
      restorationScopeId: 'app',
    );
  }
}


