import 'package:flutter/material.dart';
import 'square_button.dart';
import '../utils/constants.dart';

class CalculatorButtons extends StatelessWidget {
  final Function(String) onButtonPressed;

  const CalculatorButtons({
    super.key,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ردیف اول
        _buildButtonRow([
          _buildFunctionButton('C'),
          _buildDeleteButton(),
          _buildFunctionButton('%'),
          _buildOperatorButton('÷'),
        ]),

        // ردیف دوم
        _buildButtonRow([
          _buildNumberButton('7'),
          _buildNumberButton('8'),
          _buildNumberButton('9'),
          _buildOperatorButton('x'),
        ]),

        // ردیف سوم
        _buildButtonRow([
          _buildNumberButton('4'),
          _buildNumberButton('5'),
          _buildNumberButton('6'),
          _buildOperatorButton('–'),
        ]),

        // ردیف چهارم
        _buildButtonRow([
          _buildNumberButton('1'),
          _buildNumberButton('2'),
          _buildNumberButton('3'),
          _buildOperatorButton('+'),
        ]),

        // ردیف پنجم
        _buildButtonRow([
          _buildNumberButton('.'),
          _buildNumberButton('0'),
          _buildDeleteButton(),
          _buildOperatorButton('='),
        ]),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildButtonRow(List<Widget> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }

  Widget _buildNumberButton(String text) {
    return SquareButton(
      text: text,
      backgroundColor: AppColors.numberButton,
      onPressed: () => onButtonPressed(text),
    );
  }

  Widget _buildOperatorButton(String text) {
    return SquareButton(
      text: text,
      backgroundColor: AppColors.operatorButton,
      onPressed: () => onButtonPressed(text),
    );
  }

  Widget _buildFunctionButton(String text) {
    return SquareButton(
      text: text,
      backgroundColor: AppColors.functionButton,
      onPressed: () => onButtonPressed(text),
    );
  }

  Widget _buildDeleteButton() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.buttonPadding),
      child: ElevatedButton(
        onPressed: () => onButtonPressed('del'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(AppSizes.buttonSize, AppSizes.buttonSize),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonBorderRadius),
          ),
          backgroundColor: AppColors.functionButton,
        ),
        child: const Icon(
          Icons.backspace_outlined,
          color: AppColors.textPrimary,
          size: 24,
        ),
      ),
    );
  }
}