import 'package:flutter/material.dart';

class CustomCityDropdown extends StatelessWidget {
	static const Map<String, String> cityLabels = {
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
			items: cityLabels.entries
				.map((entry) => DropdownMenuItem(
					value: entry.key,
					child: Text(entry.value),
				))
				.toList(),
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
