import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final bool? readOnly;

  const CommonTextField({
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.validator,
    this.onTap,
    this.onChanged,
    this.textInputAction,
    this.readOnly,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly ??  false,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xff64748B)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: AppColors.primaryGreen),
            borderRadius: BorderRadius.circular(16)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xffD9D9D9)),
            borderRadius: BorderRadius.circular(16)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(16)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(16)
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16)
        ),
      ),
    );
  }
}