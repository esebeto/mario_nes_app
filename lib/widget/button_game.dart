import 'package:flutter/material.dart';

class ButtonGame extends StatelessWidget {
  const ButtonGame({Key? key, this.myIcon, this.onTap}) : super(key: key);

  final myIcon;
  final onTap;
  static bool holdingButton = false;

  bool userIsHoldingButton() {
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        holdingButton = true;
        onTap();
      },
      onTapUp: (details) {
        holdingButton = false;
      },
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.3),
          ),
          child: Icon(
            myIcon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
