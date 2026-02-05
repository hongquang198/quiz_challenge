import 'package:flutter/material.dart';

class CelebratoryEmoji extends StatefulWidget {
  const CelebratoryEmoji({super.key, required this.emoji});
  final String emoji;

  @override
  State<CelebratoryEmoji> createState() => _CelebratoryEmojiState();
}

class _CelebratoryEmojiState extends State<CelebratoryEmoji>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scale = Tween<double>(
      begin: 0.2,
      end: 3.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo));

    _opacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 1.0), weight: 15),
      TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 35),
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 0.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _opacity.value,
            child: Transform.scale(
              scale: _scale.value,
              child: Text(widget.emoji, style: const TextStyle(fontSize: 80)),
            ),
          );
        },
      ),
    );
  }
}
