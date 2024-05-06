import 'package:flutter/material.dart';

import '../../../chickies_ui.dart';

class CardSwipe extends StatefulWidget {
  const CardSwipe({super.key, required this.child, required this.onPressed, required this.height, required this.width, this.actions});

  final Function onPressed;
  final double height;
  final double width;
  final Widget child;
  final List<Widget>? actions;

  @override
  State<CardSwipe> createState() => _CardSwipeState();
}

class _CardSwipeState extends State<CardSwipe> {
  double _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            left: _position,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                final next = _position + details.delta.dx;
                if (-widget.width <= next && next <= 0) {
                  setState(() => _position += details.delta.dx);
                }
              },
              onHorizontalDragEnd: (details) {
                if (_position < -(widget.width / 2)) {
                  setState(() => _position = -widget.width);
                } else {
                  setState(() => _position = 0);
                }
              },
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onPressed();
                    },
                    child: widget.child),
                  ...widget.actions ?? [],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
