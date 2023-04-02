// slide page route builder
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliderPageRouteBuilder<T> extends CustomTransitionPage<T> {
  const SliderPageRouteBuilder({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: const Duration(milliseconds: 300),
        );

  static Widget _transitionsBuilder(BuildContext context, Animation animation,
      Animation secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.easeIn;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
