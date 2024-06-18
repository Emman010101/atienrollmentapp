import 'dart:math';

import 'package:atienrollmentapp/classes/scalerect.dart';
import 'package:flutter/material.dart';

import '../globalvars/globalvars.dart';

class Painter extends CustomPainter {
  Rect boundingBoxRect = const Rect.fromLTRB(0, 0, 0, 0);
  Point<int> nosePos = const Point(0, 0);
  Size streamImageSize = const Size(0, 0);
  Size screenSize = const Size(0,0);
  Rect bounding = const Rect.fromLTRB(0, 0, 0, 0);
  var boundingBoxDiff = 0;
  Color frameColor = Colors.red;
  Color noseColor = Colors.red;

  set setBoundingBoxRect(Rect boundingBoxRect){
    this.boundingBoxRect = boundingBoxRect;
  }

  set setNosePos(Point<int> nosePos){
    this.nosePos = nosePos;
  }

  set setStreamImageSize(Size streamImageSize){
    this.streamImageSize = streamImageSize;
  }

  get getScreenSize{
    return screenSize;
  }

  get getBoundingBoxDiff{
    return boundingBoxDiff;
  }

  set setFrameColor(Color frameColor){
    this.frameColor = frameColor;
  }

  set setNoseColor(Color noseColor){
    this.noseColor = noseColor;
  }

  @override
  void paint(Canvas canvas, Size size) {

    print("SIZE: $size");
    Paint framePaint = Paint()
      ..color = frameColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Paint nosePaint = Paint()
      ..color = noseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    screenSize = size;
    double boxWidth = size.width;
    double boxHeight = size.height;
    double halfOfWidgetWidth = boxWidth / 2;
    double halfOfWidgetHeight = boxHeight / 2;
    var scaleX = boxWidth / streamImageSize.height;
    var scaleY = boxHeight / streamImageSize.width;
    //print("streamImageSize: $streamImageSize");

    ScaleRect frameScaleRect = ScaleRect(
        rect: boundingBoxRect,
        widgetSize:
        Size(boxWidth,boxHeight),
        scaleX: scaleX,
        scaleY: scaleY);

    if(boundingBoxRect != Rect.zero){
      canvas.drawRect(
          frameScaleRect.scaleRect(), framePaint);
    }

    Rect noseRect = Rect.fromLTRB(nosePos.x.toDouble(), nosePos.y.toDouble(), 10, 10);
    ScaleRect noseScaleRect = ScaleRect(rect: noseRect, widgetSize: Size(boxWidth,boxHeight), scaleX: scaleX, scaleY: scaleY);
    Rect fnoseRect = noseScaleRect.scaleRect();

    if(nosePos.x.toInt() != 0){
      var noseTop = fnoseRect.top;
      var noseLeft = fnoseRect.left;
      //print("NoseTop: $noseTop");
      ////check the top and left position of the nose if it's on the center of the screen
      if((noseTop >= halfOfWidgetHeight-5 && noseTop <= halfOfWidgetHeight+5) && (noseLeft >= halfOfWidgetWidth-5 && noseLeft <= halfOfWidgetWidth+5)){
        noseColor = Colors.green;
        noseInCenter = true;
      }else{
        noseColor = Colors.red;
        noseInCenter = false;
      }
      canvas.drawCircle(Offset(fnoseRect.left, fnoseRect.top), 10.0, nosePaint);
    }

    bounding = frameScaleRect.scaleRect();

    boundingBoxDiff = (bounding.bottom - bounding.top).toInt();

    print("Scalex: $scaleX ScaleY: $scaleY");
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}