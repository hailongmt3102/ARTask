import 'package:flutter/material.dart';

class ResizableContainer extends StatelessWidget {
  const ResizableContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.left,
      required this.top,
      required this.scaleHeight,
      required this.scaleWidth,
      required this.child})
      : super(key: key);

  final double height;
  final double width;
  final double left;
  final double top;
  final Widget child;
  final double scaleWidth;
  final double scaleHeight;

  Matrix4 scaleXYZTransform({
    double scaleX = 1.00,
    double scaleY = 1.00,
    double scaleZ = 1.00,
  }) {
    return Matrix4.diagonal3Values(scaleX, scaleY, scaleZ);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Positioned(
        top: top / 100 * size.height,
        left: left / 100 * size.width,
        child: Transform(
          transform: scaleXYZTransform(
              scaleX: scaleWidth / 100, scaleY: scaleHeight / 100),
          child: Container(
              width: size.width * width / 100,
              height: size.height * height / 100,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: child),
        ),
      ),
    );
  }
}
