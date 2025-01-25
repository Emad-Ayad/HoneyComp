
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key, required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        SizedBox(width: 36,child: Center(child: Text(text)),),
        const Expanded(child: Divider()),
      ],
    );
  }
}