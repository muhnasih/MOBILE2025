import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.thumb_up),
      backgroundColor: Colors.pink,
    );
  }
}
