import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Color color;
  final String text;
  final Widget icon;
  final double width;
  final VoidCallback onTap;

  const DefaultButton({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
    required this.onTap,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
