import 'package:flutter/material.dart';
import 'widgets/register_form_basic.dart';
import 'widgets/register_form.dart';

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
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  bool _isAdvancedMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: _isAdvancedMode
            ? const Color(0xFFEE4D2D)
            : Colors.grey[800],
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Demo Component',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              _isAdvancedMode
                  ? 'Phiên bản: TextFormField (Tối ưu)'
                  : 'Phiên bản: TextField (Cơ bản)',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              const Text(
                'Basic',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Switch(
                value: _isAdvancedMode,
                activeThumbColor: Colors.white,
                activeTrackColor: Colors.orange[300],
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[500],
                onChanged: (value) {
                  setState(() {
                    _isAdvancedMode = value;
                  });
                },
              ),
              const Text(
                'Pro',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _isAdvancedMode
                    ? const RegisterForm(key: ValueKey('Advanced'))
                    : const RegisterFormBasic(key: ValueKey('Basic')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
