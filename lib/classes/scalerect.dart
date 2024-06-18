import 'dart:ui';

class ScaleRect {
  Rect rect;
  Size widgetSize;
  double scaleX;
  double scaleY;
  ScaleRect({
    required this.rect,
    required this.widgetSize,
    required this.scaleX,
    required this.scaleY});

//match the size of imagestream and widget
  Rect scaleRect() {
    return Rect.fromLTRB(
        (widgetSize.width - rect.left.toDouble() * scaleX),
        rect.top.toDouble() * scaleY,
        widgetSize.width - rect.right.toDouble() * scaleX,
        rect.bottom.toDouble() * scaleY);
  }
}