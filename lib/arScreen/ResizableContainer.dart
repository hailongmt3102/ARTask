import 'package:flutter/material.dart';

class ResizableContainer extends StatelessWidget {
  const ResizableContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.left,
      required this.top,
      required this.child})
      : super(key: key);

  final double height;
  final double width;
  final double left;
  final double top;

  final Widget child;

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
          transform:
              scaleXYZTransform(scaleX: width / 100, scaleY: height / 100),
          child: Container(
              width: size.width,
              height: size.height,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: child),
        ),
      ),
    );
  }
}
