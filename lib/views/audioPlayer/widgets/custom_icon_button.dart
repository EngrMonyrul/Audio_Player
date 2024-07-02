import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    this.borderColor,
    this.icon,
    this.iconSize,
    this.margin,
    this.padding,
    this.splashCircleRadius,
    this.splashColor,
    this.iconColor,
    this.circleButton,
  });

  final VoidCallback? onPressed;
  final Color? borderColor;
  final IconData? icon;
  final double? iconSize;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? splashCircleRadius;
  final Color? splashColor;
  final Color? iconColor;
  final bool? circleButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: (circleButton ?? true) ? BoxShape.circle : BoxShape.rectangle,
        border: Border.all(
          color: borderColor ?? Colors.white38,
        ),
      ),
      child: ClipRRect(
        borderRadius: splashCircleRadius ?? BorderRadius.circular(20),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: splashColor,
            onTap: onPressed,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(7),
              child: Icon(
                icon ?? Icons.favorite_border,
                color: iconColor ?? Colors.white,
                size: iconSize ?? 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
