import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({
    super.key,
    this.height,
    this.width,
  });
  const SpacerWidget.horizontal32({super.key})
      : height = 0,
        width = 32;

  const SpacerWidget.horizontal24({super.key})
      : height = 0,
        width = 24;

  const SpacerWidget.horizontal16({super.key})
      : height = 0,
        width = 16;

  const SpacerWidget.horizontal8({super.key})
      : height = 0,
        width = 08;

  const SpacerWidget.vertical32({super.key})
      : height = 32,
        width = 0;

  const SpacerWidget.vertical24({super.key})
      : height = 24,
        width = 0;

  const SpacerWidget.vertical16({super.key})
      : height = 16,
        width = 0;

  const SpacerWidget.vertical8({super.key})
      : height = 8,
        width = 0;

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
