import 'package:flutter/material.dart';

class ColumnText extends StatelessWidget {
  const ColumnText({Key? key, required this.label, required this.text})
      : super(key: key);
  final String label;
  final String text;
  final double textSize = 24;

  @override
  Widget build(BuildContext context) {
    final TextStyle stlNormal = TextStyle(
      fontSize: textSize,
    );
    final TextStyle stlBold = TextStyle(
      fontSize: textSize,
      fontWeight: FontWeight.bold,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: Text(
                  label,
                  style: stlNormal,
                ),
              ),
              Text(
                text,
                style: stlBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
