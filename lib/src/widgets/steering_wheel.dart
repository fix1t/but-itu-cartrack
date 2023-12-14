import 'package:flutter/material.dart';

class RotatingSteeringWheel extends StatefulWidget {
  final bool isActive;
  final VoidCallback onTap;

  const RotatingSteeringWheel({
    Key? key,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  _RotatingSteeringWheelState createState() => _RotatingSteeringWheelState();
}

class _RotatingSteeringWheelState extends State<RotatingSteeringWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: -0.75),
        weight: 0.25, // Adjust the weights
      ),
      TweenSequenceItem(
        tween: Tween(begin: -0.75, end: 0.75),
        weight: 0.5, // Adjust the weights
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.75, end: 0.0),
        weight: 0.25, // Adjust the weights
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
  }

  @override
  void didUpdateWidget(RotatingSteeringWheel oldWidget) {
    if (widget.isActive) {
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Transform.rotate(
        angle: _animation.value * (3.14 / 180) * 15,
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
          child: Image.asset(
            'assets/images/steering-wheel.png',
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

