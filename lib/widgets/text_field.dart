import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, 
    required this.controller, 
    this.hintText, 
    this.obscureText = false, 
    this.keyboardType, 
    this.maxLines = 1, 
    this.suffixIcon, 
    this.prefixIcon, 
    this.maskFormatter,
    this.onChanged,
  });
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final MaskTextInputFormatter? maskFormatter;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return TextFormField(
      inputFormatters: maskFormatter != null ? [maskFormatter!] : null,
      cursorColor: theme.colorScheme.primary,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.3),
      ),
    );
  }
}
