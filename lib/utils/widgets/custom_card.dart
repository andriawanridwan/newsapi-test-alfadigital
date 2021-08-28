import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  const CustomCard({
    Key? key,
    required this.child,
    this.onTap,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
