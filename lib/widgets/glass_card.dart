import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class GlassMorphicCard extends StatelessWidget {
  const GlassMorphicCard({
    Key? key,
    required this.child,
    this.isActive = false,
    this.margin = const EdgeInsets.all(8.0),
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.borderRadius = 20.0,
  }) : super(key: key);

  final Widget child;
  final bool isActive;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: isActive
            ? const LinearGradient(
                colors: [Color(0xFF1A1D3A), Color(0xFF252950)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : const LinearGradient(
                colors: [Color(0xFF0E1128), Color(0xFF0B0E20)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: isActive
              ? AppColors.primary.withOpacity(0.5)
              : Colors.white.withOpacity(0.05),
          width: isActive ? 1.5 : 1,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: card);
    }
    return card;
  }
}
