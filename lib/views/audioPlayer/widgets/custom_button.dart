import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
        this.onTap,
        this.padding,
        this.borderColor,
        this.borderRadius,
        this.border,
        this.child,
        this.splashColor});

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final Widget? child;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      splashColor: splashColor ?? Colors.red,
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: borderColor ?? Colors.red.withOpacity(0.1),
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: border ??
              Border.all(
                color: Colors.red.withOpacity(0.5),
              ),
        ),
        child: child ?? const Text("Watch Now"),
      ),
    );
  }
}
