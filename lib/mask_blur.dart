import 'package:flutter/material.dart';

class CustomPaintMaskBlur extends StatefulWidget {
  const CustomPaintMaskBlur({super.key});

  @override
  State<CustomPaintMaskBlur> createState() => _CustomPaintMaskBlurState();
}

class _CustomPaintMaskBlurState extends State<CustomPaintMaskBlur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Paint Mask Blur'),
        ),
        body: SizedBox.expand(
          child: CustomPaint(
            painter: _ExamplePainter(),
          ),
        ));
  }
}

class _ExamplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4969963, size.height * 0.2225648);
    path_0.cubicTo(
        size.width * 0.3010403,
        size.height * 0.2494297,
        size.width * 0.2630477,
        size.height * 0.4639523,
        size.width * 0.2850391,
        size.height * 0.6040218);
    path_0.cubicTo(
        size.width * 0.2850391,
        size.height * 0.6892674,
        size.width * 0.2085379,
        size.height * 0.6246876,
        size.width * 0.1895880,
        size.height * 0.7013233);
    path_0.cubicTo(
        size.width * 0.1706381,
        size.height * 0.7779591,
        size.width * 0.3566271,
        size.height * 0.8106794,
        size.width * 0.6528056,
        size.height * 0.7762360);
    path_0.cubicTo(
        size.width * 0.9489841,
        size.height * 0.7417940,
        size.width * 0.7405367,
        size.height * 0.5954106,
        size.width * 0.7398350,
        size.height * 0.4051119);
    path_0.cubicTo(
        size.width * 0.7391333,
        size.height * 0.2148145,
        size.width * 0.7419401,
        size.height * 0.1889823,
        size.width * 0.4969963,
        size.height * 0.2225648);
    path_0.close();

    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 164.0)
      ..shader = LinearGradient(
        colors: [
          const Color(0xff00AF54).withOpacity(0.3),
          const Color(0xffFFE972).withOpacity(0.3)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path_0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
