import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CalculatorDisplay extends StatelessWidget {
  final String inputExpression;
  final String calculationResult;

  const CalculatorDisplay({
    super.key,
    required this.inputExpression,
    required this.calculationResult,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // نمایش عبارت ورودی
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Text(
                inputExpression.isEmpty ? '0' : inputExpression,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: AppSizes.inputFontSize,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.end,
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 10),

            // نمایش نتیجه
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomRight,
              child: Text(
                calculationResult,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: AppSizes.displayFontSize,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.end,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}