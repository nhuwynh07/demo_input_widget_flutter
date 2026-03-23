import 'package:flutter/material.dart';

class BasicCheckboxFormField extends FormField<bool> {
  BasicCheckboxFormField({
    super.key,
    bool super.initialValue = false,
    super.enabled,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    super.onSaved,
    ValueChanged<bool>? onChanged,
    String? Function(bool?)? validator,
    String label = 'Tôi đồng ý điều khoản',
    Color activeColor = const Color(0xFFEE4D2D),
  }) : super(
         // Gia tri khoi tao cua field
         validator:
             validator ??
             (v) {
               if (v != true) {
                 return 'Vui long danh dau dong y';
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
                       onChanged: state.widget.enabled
                           ? (checked) {
                         final next = checked ?? false;
                           // Cap nhat gia tri FormFieldState
                         state.didChange(next);
                           onChanged?.call(next);
                         }
                           : null,
                       activeColor: activeColor,
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