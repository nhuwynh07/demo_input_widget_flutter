// Demo cách bạn kia sẽ dùng code của bạn trong file register_screen.dart
import 'package:flutter/material.dart';
import '../widgets/register_form.dart'; // Import Form của bạn

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Màn hình Đăng Ký')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        // Bạn ấy chỉ cần nhét cục Form của bạn vào giữa màn hình
        child: RegisterForm(),
      ),
    );
  }
}
