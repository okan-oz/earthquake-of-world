import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getNavigationBar(context);
  }

  Widget _getNavigationBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: NavBarClipper(),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.red.shade300, Colors.red.shade900])),
              ),
            )),
        Positioned(
          bottom: 45,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildNavItem(),
              SizedBox(
                width: 1,
              ),
              _buildNavItem(),
              SizedBox(
                width: 1,
              ),
              _buildNavItem()
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Earth Bag',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500)),
                SizedBox(width: 1),
                Text('Earthquakes',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500)),
                SizedBox(width: 1),
                Text('News as',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500)),
                SizedBox(width: 1)
              ],
            ))
      ],
    );
  }

  Widget _buildNavItem() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.red.shade900,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Icon(Icons.bubble_chart, color: Colors.red),
      ),
    );
  }
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double sw = size.width;
    double sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
