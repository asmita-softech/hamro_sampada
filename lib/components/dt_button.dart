import 'package:flutter/material.dart';

class DtButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double padding;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;
  final Color? iconColor;
  final bool isOutlined;
  final double width;

  const DtButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding = 16.0,
    this.fontSize = 16.0,
    this.width = double.infinity,
    this.fontWeight = FontWeight.normal,
    this.icon,
    this.iconColor,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : backgroundColor ?? Theme.of(context).primaryColor,
          foregroundColor: textColor ?? Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: isOutlined ? BorderSide(color: backgroundColor ?? Theme.of(context).primaryColor) : BorderSide.none,
          ),
          elevation: isOutlined ? 0 : 2,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: iconColor ?? textColor ?? Colors.white,
              ),
            if (icon != null) const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: isOutlined ? backgroundColor ?? Theme.of(context).primaryColor : textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
