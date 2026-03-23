import 'package:flutter/material.dart';
import 'custom_textfield.dart';

class RegisterFormBasic extends StatefulWidget {
  const RegisterFormBasic({super.key});

  @override
  _RegisterFormBasicState createState() => _RegisterFormBasicState();
}

class _RegisterFormBasicState extends State<RegisterFormBasic> {
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomInput(
          hintText: 'Họ và tên',
          prefixIcon: Icons.person_outline,
          keyboardType: TextInputType.name,
          focusNode: _nameFocus,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(_emailFocus);
          },
        ),

        const SizedBox(height: 16),

        // 2. Ô EMAIL
        CustomInput(
          hintText: 'Email',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          focusNode: _emailFocus,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(_phoneFocus);
          },
        ),

        const SizedBox(height: 16),

        CustomInput(
          hintText: 'Số điện thoại',
          prefixIcon: Icons.phone_android,
          keyboardType: TextInputType.phone,
          focusNode: _phoneFocus,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(_passwordFocus);
          },
        ),

        const SizedBox(height: 16),

        CustomInput(
          hintText: 'Mật khẩu',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
          focusNode: _passwordFocus,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(_confirmPasswordFocus);
          },
        ),

        const SizedBox(height: 16),

        CustomInput(
          hintText: 'Xác nhận mật khẩu',
          prefixIcon: Icons.lock_reset,
          isPassword: true,
          focusNode: _confirmPasswordFocus,
          textInputAction: TextInputAction.done,
        ),

        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  '⚠️ Bản Basic: Chưa có logic kiểm tra lỗi tự động!',
                ),
                backgroundColor: Colors.orange,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[700],
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'ĐĂNG KÝ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
