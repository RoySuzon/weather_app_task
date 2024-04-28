

import 'package:flutter/material.dart';
import 'package:weather_app_task/app/utils/color_pallet.dart';
import 'package:weather_app_task/app/utils/dimentions.dart';

class CustomRoundTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomRoundTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.white.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.width(100)),
        ),
        // padding:  EdgeInsets.symmetric(horizontal: context.width(5), vertical: 10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}