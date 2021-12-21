import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/arScreen/ResizableContainer.dart';

class ArScreen extends StatefulWidget {
  ArScreen({Key? key}) : super(key: key);

  @override
  _ArScreenState createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  var resizable = false;
  var information = {
    "hor_pos": 0.0,
    "ver_pos": 0.0,
    "hor_size": 100.0,
    "ver_size": 100.0,
    "hor_scale": 100.0,
    "ver_scale": 100.0,
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          ResizableContainer(
              height: information["ver_size"]!,
              width: information["hor_size"]!,
              top: information["ver_pos"]!,
              left: information["hor_pos"]!,
              scaleWidth: information["hor_scale"]!,
              scaleHeight: information["ver_scale"]!,
              child: Center(
                child: Image.asset(
                  "images/trapzoid.png",
                ),
                // Image.asset("images/rightArrow.png"),
              )),
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
                        value: information["hor_pos"]!,
                        onChanged: (value) => {
                          if (mounted)
                            setState(() {
                              information["hor_pos"] = value;
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
                        value: information["ver_pos"]!,
                        onChanged: (value) => {
                          if (mounted)
                            setState(() {
                              information["ver_pos"] = value;
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
                        value: resizable
                            ? information["hor_scale"]!
                            : information["hor_size"]!,
                        onChanged: (value) => {
                          if (mounted)
                            setState(() {
                              if (resizable)
                                information["hor_scale"] = value;
                              else
                                information["hor_size"] = value;
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
                        value: resizable
                            ? information["ver_scale"]!
                            : information["ver_size"]!,
                        onChanged: (value) => {
                          if (mounted)
                            setState(() {
                              if (resizable)
                                information["ver_scale"] = value;
                              else
                                information["ver_size"] = value;
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
        ],
      ),
    );
  }
}
