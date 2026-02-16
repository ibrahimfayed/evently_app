import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultElevatedButton extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  Color? backgroundColor;
  Color? textColor;
  String? imgpath;

  DefaultElevatedButton({
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.imgpath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 48),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
      ),
      child: imgpath != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imgpath!,
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(width: 12),
                Text(label),
              ],
            )
          : Text(label),
    );
  }
}