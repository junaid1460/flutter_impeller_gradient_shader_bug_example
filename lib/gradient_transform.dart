import 'package:flutter/material.dart';

class GradientTextTransform extends StatefulWidget {
  const GradientTextTransform({super.key});

  @override
  State<GradientTextTransform> createState() => _GradientTextTransformState();
}

class _GradientTextTransformState extends State<GradientTextTransform> {
  var _showRichText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showRichText ? SafeArea(child: _richText()) : _scrollView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _showRichText = !_showRichText;
        }),
        child: const Icon(Icons.swap_horiz_rounded),
      ),
    );
  }

  Widget _scrollView() => CustomScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          const SliverAppBar(
            title: Text('Scroll View'),
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
            child: Row(
              children: [
                _richText(),
              ],
            ),
          )),
        ],
      );

  Widget _richText() => RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Hello, ',
            ),
            TextSpan(
              text: 'John',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.blue,
                      ],
                    ).createShader(
                        const Rect.fromLTWH(0.0, 0.0, 500.0, 800.0))),
            ),
          ],
          style: const TextStyle(
            fontSize: 44,
            color: Colors.black,
          ),
        ),
      );
}
