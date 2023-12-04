import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  String error;
  IconData icon;
  bool secureText;
  int maxLines;
  TextEditingController? controller;
  Function(String text) onChange;

  DefaultTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.onChange,
    this.error = '',
    this.secureText = false,
    this.maxLines = 1,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        onChange(value);
      },
      decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          errorText: error,
          suffixIcon: Icon(
              icon
          )
      ),
      obscureText: secureText,
      maxLines: maxLines,
    );
  }
}
