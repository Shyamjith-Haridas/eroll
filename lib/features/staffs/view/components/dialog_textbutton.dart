import 'package:flutter/material.dart';

class DialogTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const DialogTextButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(label));
  }
}
