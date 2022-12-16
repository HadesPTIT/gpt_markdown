library tex_text;

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

/// A Calculator.
class TexText extends StatelessWidget {
  const TexText(this.text,
      {super.key, this.style, this.mathStyle = MathStyle.display});
  final String text;
  final TextStyle? style;
  final MathStyle mathStyle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 4,
      children: text
          .split("<m>")
          .asMap()
          .map<int, List<Widget>>(
            (index, e) {
              if (index.isOdd) {
                return MapEntry(
                  index,
                  [
                    Math.tex(
                      e,
                      textStyle: style,
                      mathStyle: mathStyle,
                    ),
                  ],
                );
              }
              return MapEntry(
                index,
                e
                    .split(" ")
                    .map<Widget>((e) => Text(
                          e,
                          style: style,
                        ))
                    .toList(),
              );
            },
          )
          .values
          .toList()
          .expand<Widget>((element) => element)
          .toList(),
    );
  }
}