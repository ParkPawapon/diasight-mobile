import 'package:flutter/material.dart';
import '../../../../../core/theme/tokens/colors/app_color_palette.dart';

enum StepStatus {
  done,
  current,
  upcoming,
}

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Function(int step)? onStepTap;

  StepIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 3,
    this.onStepTap,
  });

  StepStatus getStepStatus(int step) {
    if (step < currentStep) {
      return StepStatus.done;
    } else if (step == currentStep) {
      return StepStatus.current;
    } else {
      return StepStatus.upcoming;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: List.generate(totalSteps * 2 - 1, (index) {
          if (index.isEven) {
            final step = (index ~/ 2) + 1;

            return _buildStep(
              step,
              getStepStatus(step),
            );
          }

          return Expanded(
            child: Container(
              height: 3,
              color: AppColorPalette.deepViolet,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStep(int step, StepStatus status) {
    Color backgroundColor;
    Color textColor;
    Color borderColor;

    switch (status) {
      case StepStatus.done:
        backgroundColor = AppColorPalette.gray200;
        textColor = AppColorPalette.deepViolet;
        borderColor = AppColorPalette.gray200;
        break;

      case StepStatus.current:
        backgroundColor = AppColorPalette.deepViolet;
        textColor = AppColorPalette.white;
        borderColor = AppColorPalette.deepViolet;
        break;

      case StepStatus.upcoming:
        backgroundColor = AppColorPalette.white;
        textColor = AppColorPalette.deepViolet;
        borderColor = AppColorPalette.deepViolet;
        break;
    }

    return GestureDetector(
      onTap: () => onStepTap?.call(step),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            '$step',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
