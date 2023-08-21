import 'package:flutter/material.dart';
import 'package:test/lottie1.dart';
import 'package:test/mask_blur.dart';

import 'gradient_transform.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const Material(child: SafeArea(child: MyApp())),
  ));
}

enum Issue { gradientTransform, maskBlur, lottie1 }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _selectedIssue = Issue.lottie1;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(child: issuesChips()),
      Expanded(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: selectedIssue(),
        ),
      ),
    ]);
  }

  Widget issuesChips() {
    return Row(
      children: [
        for (final issue in Issue.values) ...[
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text(issue.toString().split('.').last),
            selected: _selectedIssue == issue,
            onSelected: (selected) => setState(() {
              _selectedIssue = issue;
            }),
          ),
        ]
      ],
    );
  }

  Widget selectedIssue() {
    switch (_selectedIssue) {
      case Issue.gradientTransform:
        return const GradientTextTransform(
          key: ValueKey(#gradient_transform),
        );
      case Issue.maskBlur:
        return const CustomPaintMaskBlur(
          key: ValueKey(#custom_paint_mask_blur),
        );
      case Issue.lottie1:
        return const LottieIssue1WithBackground(
          key: ValueKey(#lottie_issue_1_with_background),
        );
    }
  }
}
