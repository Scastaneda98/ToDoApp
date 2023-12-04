import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: neutralColor,
          )
        );
      }
  );
}