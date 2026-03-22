import 'package:flutter/material.dart';
import 'custom_checkbox.dart';
import 'custom_dropdown.dart';
import 'custom_text_form_field.dart';
import '../validators/validator.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCity;
  bool _acceptedTerms = false;

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            hintText: 'Họ và tên',
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.name,
            focusNode: _nameFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_emailFocus);
            },
            //validator: Validator.required,
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return "Không được để trống!";
              }
              return null;
            },
          ),

          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Email',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_phoneFocus);
            },
            //validator: Validator.email,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Email không được để trống!";
              }

              final emailRegex = RegExp(
                r'^[\w\.-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$',
              );

              if (!emailRegex.hasMatch(value)) {
                return "Email sai định dạng!";
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          CustomTextFormField(
            hintText: 'Số điện thoại',
            prefixIcon: Icons.phone_android,
            keyboardType: TextInputType.phone,
            focusNode: _phoneFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocus);
            },
            //validator: Validator.phone,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Số điện thoại không được để trống!";
              }

              final phoneRegex = RegExp(r'^[0-9]{10}$');

              if (!phoneRegex.hasMatch(value)) {
                return "Số điện thoại phải 10 số!";
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          CustomTextFormField(
            hintText: 'Mật khẩu',
            prefixIcon: Icons.lock_outline,
            isPassword: true,
            controller: _passwordController,
            focusNode: _passwordFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_confirmPasswordFocus);
            },
            validator: Validator.password,
          ),

          const SizedBox(height: 16),

          CustomTextFormField(
            hintText: 'Xác nhận mật khẩu',
            prefixIcon: Icons.lock_reset,
            isPassword: true,
            focusNode: _confirmPasswordFocus,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Vui lòng nhập lại mật khẩu";
              }

              if (value != _passwordController.text) {
                return "Mật khẩu xác nhận không khớp";
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          CustomCityDropdown(
            value: _selectedCity,
            onChanged: (value) {
              setState(() {
                _selectedCity = value;
              });
            },
          ),

          const SizedBox(height: 16),

          CustomTermsCheckbox(
            value: _acceptedTerms,
            onChanged: (value) {
              setState(() {
                _acceptedTerms = value;
              });
            },
          ),

          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      '🎉 Chúc mừng! Form hợp lệ, chuẩn bị gọi API!',
                    ),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('⚠️ Vui lòng sửa các lỗi màu đỏ trên form!'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEE4D2D),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'ĐĂNG KÝ TÀI KHOẢN',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
