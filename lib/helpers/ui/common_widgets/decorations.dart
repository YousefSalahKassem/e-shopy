import 'package:flutter/material.dart';
//* <------------------------------------------------------- Decoration Widgets
// Dotted Separator
// Vertical

class VerticalDashedSeparator extends StatelessWidget {
  final double width;
  final Color color;

  const VerticalDashedSeparator({this.width = 2, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainHeight();
        final dashWidth = width;
        const dashHeight = 3.0;
        final dashCount = (boxHeight / (2 * dashHeight)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

// Custom Zigzag Clipper
class CustomZigzagClipper extends CustomClipper<Path> {
  final bool isRTF;

  CustomZigzagClipper({this.isRTF = false});
  @override
  Path getClip(Size size) => isRTF ? _drawRTFPath(size) : _drawLTFPath(size);

  Path _drawRTFPath(Size size) {
    final Path path = Path();
    final double increment = size.height / 10;
    double y = 0;
    double x = size.width;

    path.lineTo(0.0, 0.0);
    y += increment;
    path.lineTo(size.width * 0.03, y);
    while (y < size.height) {
      x = (x == 0.0) ? size.width * 0.03 : 0.0;
      y += increment;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  Path _drawLTFPath(Size size) {
    final Path path = Path();
    final double increment = size.height / 10;
    double y = 0;
    double x = size.width;

    path.lineTo(size.width, 0.0);
    y += increment;
    path.lineTo(size.width * 0.97, y);
    y += increment;
    path.lineTo(size.width, y);
    while (y < size.height) {
      x = (x == size.width) ? size.width * 0.97 : size.width;
      y += increment;
      path.lineTo(x, y);
    }
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
