import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TouchReaction extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  final BorderRadius? radius;

  const TouchReaction({required this.child, required this.onTap, this.radius});

  @override
  _TouchReactionState createState() => _TouchReactionState();
}

class _TouchReactionState extends State<TouchReaction> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Material(
        color: Colors.transparent,
        borderRadius: widget.radius ?? BorderRadius.circular(0),
        child: InkWell(
          borderRadius: widget.radius ?? BorderRadius.circular(0),
          onTap: widget.onTap,
          child: widget.child,
          highlightColor: Colors.transparent,
        ),
      );
    }
    if (Platform.isIOS) {
      return Material(
        color: Colors.transparent,
        borderRadius: widget.radius ?? BorderRadius.circular(0),
        child: TouchableOpacity(
          onTap: widget.onTap,
          child: widget.child,
        ),
      );
    }
    return Material(
      color: Colors.transparent,
      borderRadius: widget.radius ?? BorderRadius.circular(0),
      child: InkWell(
        borderRadius: widget.radius ?? BorderRadius.circular(0),
        onTap: widget.onTap,
        child: widget.child,
        highlightColor: Colors.transparent,
      ),
    );
  }
}

class TouchableOpacity extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.5;

  TouchableOpacity({@required required this.child, required this.onTap});

  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isDown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) =>
      widget.onTap != null ? setState(() => isDown = true) : null,
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onTap,
      child: Container(
        child: AnimatedOpacity(
          child: widget.child,
          duration: widget.duration,
          opacity: isDown ? widget.opacity : 1,
        ),
      ),
    );
  }
}
