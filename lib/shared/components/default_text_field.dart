import 'package:flutter/material.dart';

class DefalutTextField extends StatelessWidget {
  const DefalutTextField({
    super.key,
    required this.textController,
    required this.validator,
    required this.hitText,
    this.maxLines = 1,
  });
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final String hitText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hitText,
        hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
