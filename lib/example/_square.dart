import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.blue;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    // 三角（塗りつぶし）
    paint.color = Colors.purple;
    var path = Path();
    //三角形の頂点の位置
    path.moveTo(size.width / 2, size.height / 5);

    path.lineTo(size.width / 4, size.height / 5 * 2);

    path.lineTo(size.width / 4 * 3, size.height / 5 * 2);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
