import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const SquareButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.functionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.buttonPadding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(AppSizes.buttonSize, AppSizes.buttonSize),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonBorderRadius),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: AppSizes.buttonFontSize,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}