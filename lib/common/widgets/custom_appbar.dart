import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.bottomHeight = 0,
    this.title,
    this.actions,
    this.useLeading,
    this.leadingIcon,
    this.bottom,
  });

  final double? bottomHeight;
  final Widget? title;
  final List<Widget>? actions;
  final bool? useLeading;
  final Widget? leadingIcon;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: leadingIcon ??
          ((useLeading ?? false)
              ? IconButton(
                  onPressed: () => Navigator.pop,
                  icon: const Icon(Icons.arrow_back_ios_new))
              : null),
      title: title,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: bottom ?? const SizedBox(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomHeight!);
}
