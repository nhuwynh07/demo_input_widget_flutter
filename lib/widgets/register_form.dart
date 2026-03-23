import 'package:flutter/material.dart';
import 'custom_checkbox.dart';
import '../validators/validator.dart';
import '../screens/success_screen.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  static const Map<String, String> _cityLabels = {
    'hcm': 'TP. Hồ Chí Minh',
    'hn': 'Hà Nội',
    'dn': 'Đà Nẵng',
    'ct': 'Cần Thơ',
    'hp': 'Hải Phòng',
    'bd': 'Bắc Đông',
    'yd': 'Yên Bái',
    'ql': 'Quảng Ninh',
    'td': 'Thái Đông',
    'lb': 'Lạng Sơn',
    'nd': 'Nghệ An',
    'ha': 'Hà Tĩnh',
    'qt': 'Quảng Trị',
    'th': 'Thừa Thiên - Huế',
    'qn': 'Quảng Nam',
    'qg': 'Quảng Ngãi',
    'bn': 'Bình Định',
    'pt': 'Phú Yên',
    'kb': 'Khánh Hòa',
    'nn': 'Ninh Thuận',
    'nb': 'Ninh Bình',
    'bp': 'Bình Phước',
    'br': 'Bình Rượu',
    'bg': 'Bạc Liêu',
    'cg': 'Cà Mau',
    'ag': 'An Giang',
    'vl': 'Vĩnh Long',
    'sd': 'Sóc Trăng',
    'tv': 'Trà Vinh',
    'dt': 'Đồng Tháp',
  };

  final _formKey = GlobalKey<FormState>();
  String? _selectedCity;
  String _savedName = '';
  String _savedEmail = '';
  String _savedPhone = '';
  String? _savedCity;
  bool _acceptedTerms = false;

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final AutovalidateMode _autoValidateMode =
      AutovalidateMode.onUserInteraction; // Tự động validate khi người dùng tương tác

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
          TextFormField(
            autovalidateMode: _autoValidateMode,
            keyboardType: TextInputType.name,
            focusNode: _nameFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_emailFocus);
            },
            restorationId: 'name_field',
            decoration: InputDecoration(
              hintText: 'Họ và tên',
              prefixIcon: Icon(Icons.person_outline, color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFFEE4D2D), width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            //validator: null,
            validator: Validator.required,
            onSaved: (value) {
              _savedName = value?.trim() ?? '';
            },
          ),

          const SizedBox(height: 16),
          TextFormField(
            autovalidateMode: _autoValidateMode,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_phoneFocus);
            },
            restorationId: 'email_field',
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFFEE4D2D), width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            //validator: null,
            validator: Validator.email,
            onSaved: (value) {
              _savedEmail = value?.trim() ?? '';
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            autovalidateMode: _autoValidateMode,
            keyboardType: TextInputType.phone,
            focusNode: _phoneFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocus);
            },
            restorationId: 'phone_field',
            decoration: InputDecoration(
              hintText: 'Số điện thoại',
              prefixIcon: Icon(Icons.phone_android, color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFFEE4D2D), width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            //validator: null,
            validator: Validator.phone,
            onSaved: (value) {
              _savedPhone = value?.trim() ?? '';
            },
          ),

          const SizedBox(height: 16),

          // TextFormField(
          //   hintText: 'Mật khẩu',
          //   prefixIcon: Icons.lock_outline,
          //   isPassword: true,
          //   focusNode: _passwordFocus,
          //   onFieldSubmitted: (_) {
          //     FocusScope.of(context).requestFocus(_confirmPasswordFocus);
          //   },
          //   validator: null,
          // ),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            autovalidateMode: _autoValidateMode,
            focusNode: _passwordFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_confirmPasswordFocus);
            },
            decoration: InputDecoration(
              hintText: 'Mật khẩu',
              prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFFEE4D2D), width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            validator: Validator.password,
          ),

          const SizedBox(height: 16),

          // TextFormField(
          //   hintText: 'Xác nhận mật khẩu',
          //   prefixIcon: Icons.lock_reset,
          //   isPassword: true,
          //   focusNode: _confirmPasswordFocus,
          //   textInputAction: TextInputAction.done,
          //   validator: null,
          // ),
          TextFormField(
            obscureText: true,
            autovalidateMode: _autoValidateMode,
            focusNode: _confirmPasswordFocus,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'Xác nhận mật khẩu',
              prefixIcon: Icon(Icons.lock_reset, color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFFEE4D2D), width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
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

          DropdownButtonFormField<String>(
            initialValue: _selectedCity,
            autovalidateMode: _autoValidateMode,
            decoration: InputDecoration(
              hintText: 'Chọn thành phố',
              prefixIcon: Icon(Icons.location_city_outlined, color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFFEE4D2D), width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            items: _cityLabels.entries
                .map((entry) => DropdownMenuItem<String>(
                      value: entry.key,
                      child: Text(entry.value),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCity = value;
              });
            },
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Vui lòng chọn thành phố';
              }
              return null;
            },
            onSaved: (value) {
              _savedCity = value;
            },
          ),

          const SizedBox(height: 16),

          CustomTermsCheckbox(
            value: _acceptedTerms,
            autovalidateMode: _autoValidateMode,
            onChanged: (value) {
              setState(() {
                _acceptedTerms = value;
              });
            },
            errorBuilder: (context, errorText) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.eco_outlined, size: 14, color: Color(0xFF2E7D32)),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      'Custom: $errorText',
                      style: const TextStyle(
                        color: Color(0xFF2E7D32),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {

                _formKey.currentState!.save();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessScreen(
                      name: _savedName,
                      email: _savedEmail,
                      phone: _savedPhone,
                      city: _savedCity != null
                          ? _cityLabels[_savedCity] ?? 'Chưa chọn'
                          : 'Chưa chọn',
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('⚠️ Vui lòng sửa các lỗi trên form!'),
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
