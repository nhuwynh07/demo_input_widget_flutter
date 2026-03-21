import 'package:flutter/material.dart';

class CustomTermsCheckbox extends FormField<bool> {
	CustomTermsCheckbox({
		super.key,
		required bool value,
		required ValueChanged<bool> onChanged,
		String? Function(bool?)? validator,
		String label = 'Tôi cam kết thông tin là chính xác',
	}) : super(
				 initialValue: value,
				 validator:
						 validator ??
						 (v) {
							 if (v != true) {
								 return 'Bạn cần đồng ý cam kết';
							 }
							 return null;
						 },
				 builder: (state) {
					 return Column(
						 crossAxisAlignment: CrossAxisAlignment.start,
						 children: [
							 Container(
								 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
								 decoration: BoxDecoration(
									 border: Border.all(
										 color: state.hasError ? Colors.red : Colors.transparent,
										 width: 1.2,
									 ),
									 borderRadius: BorderRadius.circular(8),
								 ),
								 child: Row(
									 children: [
										 Checkbox(
											 value: state.value ?? false,
											 onChanged: (checked) {
												 final next = checked ?? false;
												 state.didChange(next);
												 onChanged(next);
											 },
											 activeColor: const Color(0xFFEE4D2D),
										 ),
										 Expanded(child: Text(label)),
									 ],
								 ),
							 ),
							 if (state.hasError)
								 Padding(
									 padding: const EdgeInsets.only(left: 12, top: 6),
									 child: Text(
										 state.errorText ?? '',
										 style: const TextStyle(color: Colors.red, fontSize: 12),
									 ),
								 ),
						 ],
					 );
				 },
			 );
}
