import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';

class DefaultButton extends StatelessWidget {

  Function() onPressed;
  String buttonText;

  DefaultButton({super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor
        ),
        child: Stack(
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ) ,
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            )
          ],
        )
    );
  }
}
