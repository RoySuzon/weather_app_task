import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_task/app/utils/color_pallet.dart';
import 'package:weather_app_task/app/utils/dimentions.dart';

class CustomCardButton extends StatelessWidget {
  final String icon;
  final String heading;
  final String subtitle;
  final VoidCallback onPressed;

  const CustomCardButton({
    super.key,
    required this.icon,
    required this.heading,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            // boxShadow: const [],
            border: Border.all(color: AppColors.white.withOpacity(.2),strokeAlign: BorderSide.strokeAlignInside,width: context.width(1.5)),
            borderRadius: BorderRadius.circular(context.width(100)),
            color: Colors.white30),
        padding:  EdgeInsets.symmetric(vertical: context.width(0), horizontal: context.width(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              heading,
              style:
                   GoogleFonts.inter(fontSize: context.width(14), fontWeight: FontWeight.bold),
            ),
            // const SizedBox(width: 8.0),
            SizedBox(
              height: context.width(50),
              width: context.width(50),
              child: Image.asset(
                icon,
              ),
            ),
             SizedBox(height: context.width(5)),
            Text(
              subtitle,
              style:
                   GoogleFonts.inter(fontSize: context.width(14), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
