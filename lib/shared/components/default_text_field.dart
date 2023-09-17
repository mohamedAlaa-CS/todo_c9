import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.textController,
    this.validator,
    this.hitText,
    this.maxLines = 1,
    this.initialValue,
    this.onChanged,
  });
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final String? hitText;
  final int? maxLines;
  final String? initialValue;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      style: theme.textTheme.bodySmall,
      controller: textController,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hitText,
        hintStyle: theme.textTheme.bodySmall,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
