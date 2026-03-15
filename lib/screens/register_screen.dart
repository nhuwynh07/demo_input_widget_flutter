import 'package:flutter/material.dart';
import '../widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Màn hình Đăng Ký')),
      body: Padding(padding: const EdgeInsets.all(24.0), child: RegisterForm()),
    );
  }
}
