import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool hasCircularBorder;

  const MainButton({super.key, required this.onPressed, required this.text,  this.hasCircularBorder = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: hasCircularBorder ?  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0)
          ): null
          ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
