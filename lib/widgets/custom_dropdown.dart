import 'package:flutter/material.dart';

class CustomCityDropdown extends StatelessWidget {
	final String? value;
	final ValueChanged<String?> onChanged;
	final String? Function(String?)? validator;

	const CustomCityDropdown({
		super.key,
		required this.value,
		required this.onChanged,
		this.validator,
	});

	@override
	Widget build(BuildContext context) {
		return DropdownButtonFormField<String>(
			initialValue: value,
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
			items: const [
				DropdownMenuItem(value: 'hcm', child: Text('TP. Hồ Chí Minh')),
				DropdownMenuItem(value: 'hn', child: Text('Hà Nội')),
				DropdownMenuItem(value: 'dn', child: Text('Đà Nẵng')),
				DropdownMenuItem(value: 'ct', child: Text('Cần Thơ')),
				DropdownMenuItem(value: 'hp', child: Text('Hải Phòng')),
				DropdownMenuItem(value: 'bd', child: Text('Bắc Đông')),
				DropdownMenuItem(value: 'yd', child: Text('Yên Bái')),
				DropdownMenuItem(value: 'ql', child: Text('Quảng Ninh')),
				DropdownMenuItem(value: 'td', child: Text('Thái Đông')),
				DropdownMenuItem(value: 'lb', child: Text('Lạng Sơn')),
				DropdownMenuItem(value: 'nd', child: Text('Nghệ An')),
				DropdownMenuItem(value: 'ha', child: Text('Hà Tĩnh')),
				DropdownMenuItem(value: 'qt', child: Text('Quảng Trị')),
				DropdownMenuItem(value: 'th', child: Text('Thừa Thiên - Huế')),
				DropdownMenuItem(value: 'qn', child: Text('Quảng Nam')),
				DropdownMenuItem(value: 'qg', child: Text('Quảng Ngãi')),
				DropdownMenuItem(value: 'bn', child: Text('Bình Định')),
				DropdownMenuItem(value: 'pt', child: Text('Phú Yên')),
				DropdownMenuItem(value: 'kb', child: Text('Khánh Hòa')),
				DropdownMenuItem(value: 'nn', child: Text('Ninh Thuận')),
				DropdownMenuItem(value: 'nb', child: Text('Ninh Bình')),
				DropdownMenuItem(value: 'bp', child: Text('Bình Phước')),
				DropdownMenuItem(value: 'br', child: Text('Bình Rượu')),
				DropdownMenuItem(value: 'bg', child: Text('Bạc Liêu')),
				DropdownMenuItem(value: 'cg', child: Text('Cà Mau')),
				DropdownMenuItem(value: 'ag', child: Text('An Giang')),
				DropdownMenuItem(value: 'vl', child: Text('Vĩnh Long')),
				DropdownMenuItem(value: 'sd', child: Text('Sóc Trăng')),
				DropdownMenuItem(value: 'tv', child: Text('Trà Vinh')),
				DropdownMenuItem(value: 'dv', child: Text('Đồng Tháp')),
			],
			onChanged: onChanged,
			validator:
					validator ??
					(v) {
						if (v == null || v.isEmpty) {
							return 'Vui lòng chọn thành phố';
						}
						return null;
					},
		);
	}
}
