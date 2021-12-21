import 'package:flutter/material.dart';

class ArFrame extends StatelessWidget {
  const ArFrame({
    Key? key,
    required this.monitor,
    required this.size,
  }) : super(key: key);

  final Map<String, double> monitor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (monitor["ver_pos"]! / 100) * size.height,
      left: (monitor["hor_pos"]! / 100) * size.width,
      child: Container(
        height: (monitor["ver_size"]! / 100) * size.height * monitor["resize"]!,
        width: (monitor["hor_size"]! / 100) * size.width * monitor["resize"]!,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.green),
        ),
      ),
    );
  }
}
