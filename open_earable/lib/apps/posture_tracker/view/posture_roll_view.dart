// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:open_earable/apps/posture_tracker/view/arc_painter.dart';

class PostureRollView extends StatelessWidget {
  final double roll;

  final String headAssetPath;
  final String neckAssetPath;
  final AlignmentGeometry headAlignment;

  const PostureRollView({Key? key,
                         required this.roll,
                         required this.headAssetPath,
                         required this.neckAssetPath,
                         this.headAlignment = Alignment.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "${(this.roll * 180 / 3.14).abs().toStringAsFixed(0)}°",
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 30,
          fontWeight: FontWeight.bold
        )
      ),
      CustomPaint(
        painter: ArcPainter(angle: this.roll),
        child: Padding(
        padding: EdgeInsets.all(10),
          child: ClipOval(
            child: Stack(children: [
              Image.asset(this.neckAssetPath),
              Transform.rotate(
                angle: this.roll,
                alignment: this.headAlignment,
                child: Image.asset(this.headAssetPath)
              ),
            ])
          )
        )
      ),
    ]);
  }
}