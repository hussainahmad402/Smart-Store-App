import 'package:flutter/material.dart';
import 'package:smartstore/utils/app_textstyle.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final IconData prefixicon;
  final TextInputType keyboardtype;
  final bool isPassoword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextfield({
    super.key,
    required this.label,
    required this.prefixicon,
    this.keyboardtype = TextInputType.text,
    this.isPassoword = false,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassoword && _obsecureText,
      keyboardType: widget.keyboardtype,
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: AppTextstyle.withColor(
        AppTextstyle.bodyMedium,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextstyle.withColor(
          AppTextstyle.bodyMedium,
          isDark ? Colors.grey[400]! : Colors.grey[600]!,
        ),
        prefixIcon: Icon(
          widget.prefixicon,
          color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
        ),
        suffixIcon:
            widget.isPassoword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  },
                  icon: Icon(
                    _obsecureText ? Icons.visibility_off : Icons.visibility,
                  ),
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
