import 'package:flutter/material.dart';
import 'package:test/mask_blur.dart';

import 'gradient_transform.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: Material(child: SafeArea(child: const MyApp())),
  ));
}

enum Issue {
  gradientTransform,
  maskBlur,
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _selectedIssue = Issue.maskBlur;

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
        for (final (index, issue) in Issue.values.indexed) ...[
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
    }
  }
}
