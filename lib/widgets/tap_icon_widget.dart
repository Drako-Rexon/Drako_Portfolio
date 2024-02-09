import 'package:flutter/material.dart';

class TapIconwidget extends StatelessWidget {
  TapIconwidget({super.key, required this.icon, this.onTap});

  final IconData icon;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    );
  }
}
