import 'package:flutter/material.dart';

class TitleBodyWidget extends StatelessWidget {
  final String text;
  final bool isTitle;
  const TitleBodyWidget({Key? key, required this.text, required this.isTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isTitle ? 20 : 16,
          fontWeight: isTitle ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
