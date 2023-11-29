import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  String error;
  IconData icon;
  bool secureText;
  Function(String text) onChange;

  DefaultTextField({super.key, required this.label, required this.icon, required this.onChange, this.error = '', this.secureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChange(value);
      },
      decoration: InputDecoration(
          label: Text(label),
          errorText: error,
          suffixIcon: Icon(
              icon
          )
      ),
      obscureText: secureText,
    );
  }
}
