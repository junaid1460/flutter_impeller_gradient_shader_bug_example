import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'assets.dart';

class LottieIssue1WithBackground extends StatelessWidget {
  const LottieIssue1WithBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -60,
          top: -10,
          child: CustomPaint(
            painter:
                OvalBlurPainter(blurSigma: 100, color: const Color(0xFF347B6F)),
            child: const SizedBox(
              width: 462,
              height: 463,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 4),
          child: AspectRatio(aspectRatio: 720 / 626, child: Container()),
        ),
        Positioned.fill(
          top: -100,
          child: LottieBuilder.asset(
            Assets.milestoneLandingLottie,
            repeat: false,
          ),
        ),
      ],
    );
  }
}

class OvalBlurPainter extends CustomPainter {
  final double blurSigma;
  final Color color;
  OvalBlurPainter({
    required this.blurSigma,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    canvas.drawOval(Rect.fromLTWH(0, 0, size.width, size.height), line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
