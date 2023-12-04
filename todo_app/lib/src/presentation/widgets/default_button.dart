import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/utils/base_color.dart';

class DefaultButton extends StatelessWidget {

  Function() onPressed;
  String buttonText;
  IconData icon;
  Color color;

  DefaultButton({super.key, required this.onPressed, required this.buttonText, this.icon = Icons.arrow_forward_ios, this.color = primaryColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color
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
              child: Icon(
                icon,
                color: Colors.black,
              ),
            )
          ],
        )
    );
  }
}
