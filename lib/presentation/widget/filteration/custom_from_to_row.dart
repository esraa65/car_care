import 'package:flutter/material.dart';

import '../custom/default_text.dart';

class CustomFromToRow extends StatelessWidget {
  const CustomFromToRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultText(
          text: "الي",
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        DefaultText(
          text: "من",
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
