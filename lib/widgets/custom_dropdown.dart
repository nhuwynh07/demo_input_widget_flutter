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
			value: value,
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
				DropdownMenuItem(value: 'hcm', child: Text('TP. Ho Chi Minh')),
				DropdownMenuItem(value: 'hn', child: Text('Ha Noi')),
				DropdownMenuItem(value: 'dn', child: Text('Da Nang')),
				DropdownMenuItem(value: 'ct', child: Text('Can Tho')),
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
