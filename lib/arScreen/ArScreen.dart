import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'ArFrame.dart';

class ArScreen extends StatefulWidget {
  ArScreen({Key? key}) : super(key: key);

  @override
  _ArScreenState createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  TransformationController controller = new TransformationController();

  var monitor = {
    "hor_size": 40.0,
    "ver_size": 40.0,
    "resize": 1.0,
    "hor_pos": 0.0,
    "ver_pos": 0.0,
  };

  var imageInfor = {"hor_pos": 0.0, "ver_pos": 0.0, "scale": 1.0};

  bool resizable = false;

  // calculate new position like : x,y of green frame
  double calculateNewFramePos(double oldBackgroundPos, double newBackgroundPos,
      double framePos, bool resizable) {
    if (resizable)
      return rangeCheck(0, 100, framePos + newBackgroundPos - oldBackgroundPos);
    else
      return rangeCheck(0, 100, framePos);
  }

  // calculate new scale green frame
  double calculateNewFrameScale(double oldBackgroundScale,
      double newBackgroundScale, double frameScale, bool resizable) {
    if (resizable)
      return rangeCheck(
          0, 100, frameScale * oldBackgroundScale / newBackgroundScale);
    else
      return rangeCheck(0, 100, frameScale);
  }

  double rangeCheck(double min, double max, double value) {
    if (value < min)
      return min;
    else if (value > max) return max;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.white,
      child: Stack(children: [
        Positioned(
          top: imageInfor["ver_pos"]! / 100 * size.height,
          left: imageInfor["hor_pos"]! / 100 * size.width,
          child: Image.asset(
            "images/box.jpg",
            fit: BoxFit.contain,
            scale: imageInfor["scale"]!,
          ),
        ),
        ArFrame(monitor: monitor, size: size),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            color: Colors.black45,
            // height: size.height / 4,
            // width: size.width / 4,
            child: Column(
              children: [
                Row(children: [
                  Text(
                    "Resizable",
                    style: TextStyle(color: Colors.white),
                  ),
                  Switch(
                    value: resizable,
                    onChanged: (value) => {
                      setState(() {
                        resizable = value;
                      })
                    },
                  ),
                ]),
                Row(
                  children: [
                    Text(
                      "Horizontal Pos",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: monitor["hor_pos"]!,
                      onChanged: (value) => {
                        if (mounted)
                          setState(() {
                            monitor["hor_pos"] = value;
                          })
                      },
                      divisions: 100,
                      max: 100,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Vertical Pos",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: monitor["ver_pos"]!,
                      onChanged: (value) => {
                        if (mounted)
                          setState(() {
                            monitor["ver_pos"] = value;
                          })
                      },
                      divisions: 100,
                      max: 100,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Horizontal Size",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: monitor["hor_size"]!,
                      onChanged: (value) => {
                        if (mounted)
                          setState(() {
                            monitor["hor_size"] = value;
                          })
                      },
                      divisions: 100,
                      max: 100,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Vertical Size",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: monitor["ver_size"]!,
                      onChanged: (value) => {
                        if (mounted)
                          setState(() {
                            monitor["ver_size"] = value;
                          })
                      },
                      divisions: 100,
                      max: 100,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            color: Colors.black45,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Image horizontal pos",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: imageInfor["hor_pos"]!,
                      onChanged: (value) => {
                        if (mounted)
                          setState(() {
                            monitor["hor_pos"] = calculateNewFramePos(
                                imageInfor["hor_pos"]!,
                                value,
                                monitor["hor_pos"]!,
                                resizable);
                            imageInfor["hor_pos"] = value;
                          })
                      },
                      divisions: 100,
                      max: 100,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Image vertical pos",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: imageInfor["ver_pos"]!,
                      onChanged: (value) => {
                        if (mounted)
                          setState(() {
                            monitor["ver_pos"] = calculateNewFramePos(
                                imageInfor["ver_pos"]!,
                                value,
                                monitor["ver_pos"]!,
                                resizable);
                            imageInfor["ver_pos"] = value;
                          })
                      },
                      divisions: 100,
                      max: 100,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Image resize",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: imageInfor["scale"]!,
                      onChanged: (value) => {
                        setState(() {
                          monitor["resize"] = calculateNewFrameScale(
                              imageInfor["scale"]!,
                              value,
                              monitor["resize"]!,
                              resizable);
                          imageInfor["scale"] = value;
                        })
                      },
                      divisions: 7,
                      max: 2,
                      min: 0.6,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
