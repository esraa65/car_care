
import 'package:car_care/presentation/widget/custom/default_text.dart';
import 'package:flutter/material.dart';

class CustomOr extends StatelessWidget {
  const CustomOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[400],
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DefaultText(text: "context.tr.or"),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[400],
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
