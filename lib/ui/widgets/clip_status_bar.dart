import 'package:flutter/material.dart';

class ClipStatusBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    path.quadraticBezierTo(0, h * 0.1, w * 0.4, h * 0.1);
    path.lineTo(w * 0.5, h * 0.1);
    path.quadraticBezierTo(w, h * 0.1, w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.quadraticBezierTo(w, h * 0.9, w * 0.5, h * 0.9);
    path.lineTo(w * 0.4, h * 0.9);
    path.quadraticBezierTo(0, h * 0.9, 0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/*final w = size.width;
final h = size.height;
final path = Path();
path.quadraticBezierTo(w * 0.1, h * 0.1, w * 0.2, h * 0.1);
path.lineTo(w, h * 0.1);
path.quadraticBezierTo(w * 0.5, h * 0.1, w * 0.5, h * 0.3);
path.lineTo(w * 0.5, h * 0.7);
path.quadraticBezierTo(w * 0.5, h * 0.9, w * 0.3, h * 0.9);
path.lineTo(w, h * 0.9);
path.quadraticBezierTo(w * 0.1, h * 0.9, 0, h);
path.close();
return path;*/
