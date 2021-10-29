import 'package:flutter/material.dart';

class BlinkingButton extends StatefulWidget {
  BlinkingButton(this.onPressed, this.active);
  Function onPressed;
  bool active = false;

  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<BlinkingButton> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(milliseconds: 1500), animationBehavior: AnimationBehavior.preserve);
    _animationController.repeat(reverse: true);
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return widget.active
  //       ? FadeTransition(
  //           opacity: _animationController, //child: Icon(Icons.gps_fixed, size: 35, color: true == true ? Colors.blue.shade700 : Colors.white)
  //           child: GestureDetector(
  //             onTap: widget.onPressed,
  //             child: Icon(Icons.gps_fixed, size: 35, color: widget.active == true ? Colors.blue : Colors.white),
  //           ))
  //       : Icon(Icons.gps_fixed, size: 35, color: widget.active == true ? Colors.blue : Colors.white);
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: widget.active
            ? FadeTransition(
                opacity: _animationController, //child: Icon(Icons.gps_fixed, size: 35, color: true == true ? Colors.blue.shade700 : Colors.white)
                child: GestureDetector(
                  onTap: widget.onPressed,
                  child: Icon(Icons.gps_fixed, size: 35, color: widget.active == true ? Colors.blue : Colors.white),
                ))
            : Icon(Icons.gps_fixed, size: 35, color: widget.active == true ? Colors.blue : Colors.white));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
