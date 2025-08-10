import 'package:flutter/material.dart';

import '../units/fuction/direction_method.dart';

class TextResponsiveLang extends StatelessWidget {
  const TextResponsiveLang({super.key, required this.text, this.style, this.maxLines, this.overflow});
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:ResponsiveLanguageText.getAlignment(text),
      child: Text(
          text,
          maxLines: maxLines,
          textDirection:ResponsiveLanguageText.getTextDirection(text),
          overflow:overflow,
          textAlign: ResponsiveLanguageText.getTextAlign(text),
          style:style
      ),
    );
  }
}
