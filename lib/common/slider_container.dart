// slider container

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliderContainer extends StatefulWidget implements PreferredSizeWidget {
  SliderContainer({
    Key? key,
    required this.child,
    required this.direction,
  }) : super(key: key);

  PreferredSizeWidget child;
  ScrollDirection direction;

  @override
  Size get preferredSize => child.preferredSize;
  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _begin = const Offset(0, -1);

  final _end = const Offset(0, 0);

  var _tween;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _tween = Tween<Offset>(begin: _begin, end: _end).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.direction == ScrollDirection.forward) {
      _controller.reverse();
    }
    if (widget.direction == ScrollDirection.reverse) {
      _controller.forward();
    }
    return SlideTransition(
      position: _tween,
      child: widget.child,
    );
  }
}
