import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, this.imgPath, this.child, this.padding});

  final String? imgPath;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(
                imgPath ?? "",
              ),
              fit: BoxFit.cover,
              opacity: 0.8,
            ),
          ),
        ),
        Container(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12,
                Colors.black26,
                Colors.black38,
                Colors.black45,
                Colors.black54,
                Colors.black87,
                Colors.black,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
