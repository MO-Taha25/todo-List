import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';

class DefaultElevatedBottom extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  DefaultElevatedBottom({required this.label, required this.onPressed});

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.sizeOf(context).width, 52)),
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppTheme.white,
              fontSize: 24,
            ),
      ),
    );
  }
}
