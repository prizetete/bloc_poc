import 'package:bloc_poc/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? name;

  const CustomFloatingActionButton({super.key, this.onPressed, this.name});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: randomString(5),
      onPressed: onPressed,
      child: Text(name ?? ""),
    );
  }
}
