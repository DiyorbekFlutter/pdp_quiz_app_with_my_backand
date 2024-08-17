import 'package:flutter/material.dart';

class BottomNavigationBarBackground extends StatelessWidget {
  final Widget child;
  const BottomNavigationBarBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipPath(
          clipper: BottomNavigationBarBackgroundClipper(),
          child: Container(
            height: 86,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        ClipPath(
          clipper: BottomNavigationBarBackgroundClipper(),
          child: Container(
            height: 85,
            color: Colors.white,
            child: Transform.translate(
              offset: const Offset(0, -8),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

class BottomNavigationBarBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
