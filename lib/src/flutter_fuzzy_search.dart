import 'dart:developer';

import 'package:diff_match_patch/diff_match_patch.dart';
import 'package:flutter/material.dart';

/// WIP
class FuzzySearch extends StatelessWidget {
  /// WIP
  const FuzzySearch({
    Key? key,
    required this.inputText,
    required this.pattern,
    this.noMatchFoundCallback,
    this.location = 10,
    this.threshold = 0.8,
    this.distance = 1000,
  }) : super(key: key);

  final String inputText;
  final String pattern;
  final int location;
  final double threshold;
  final int distance;
  final Function? noMatchFoundCallback;
  @override
  Widget build(BuildContext context) {
    final int result = match(inputText, pattern, location, threshold: threshold, distance: distance);
    if (result == -1) {
      log('No matches found on text :\n$inputText \non : \n$pattern\n');
      noMatchFoundCallback?.call();
      return Container();
    } else {
      return SelectableText.rich(
        TextSpan(
          children: [TextSpan(), TextSpan(), TextSpan()],
        ),
      );
    }
  }
}
