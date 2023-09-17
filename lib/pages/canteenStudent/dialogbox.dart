import 'package:flutter/material.dart';

class FullScreenDialog extends StatelessWidget {
  final Widget content;

  FullScreenDialog({required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: content,
      ),
    );
  }
}
