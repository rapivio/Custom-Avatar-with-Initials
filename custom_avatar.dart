// ============================================================
// 📦 Weekly FlutterFlow Custom Code – Week 3
// 🧩 Custom Avatar Widget with Initials Fallback
// 👤 Author: Brani | Rapivio
// 📅 Week 3 of the "Weekly FlutterFlow Custom Code" Series
//
// A production-ready avatar widget that displays a user's
// profile image when available, and gracefully falls back
// to styled initials (like Google, Slack, Microsoft Teams).
//
// ✅ Features:
//   - Displays network image if imageUrl is provided
//   - Falls back to initials from firstName + lastName
//   - Deterministic background color based on the name
//   - Configurable size, border radius, font size
//   - Optional border with custom color
//   - Supports circular & rounded rectangle shapes
//   - Optional fade-in animation for loaded images
//
// 🔧 FlutterFlow Setup:
//   1. Create a new Custom Widget
//   2. Name it: CustomAvatar
//   3. Add the parameters listed below
//   4. Paste this code
//   5. Set width & height in the widget tree to match size
// ============================================================

// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:firebase_storagelibrary_2sa6k9/backend/schema/structs/index.dart"
    as firebase_storagelibrary_2sa6k9_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import "package:firebase_storagelibrary_2sa6k9/backend/schema/structs/index.dart"
    as firebase_storagelibrary_2sa6k9_data_schema;
import "package:firebase_storagelibrary_2sa6k9/backend/schema/enums/enums.dart"
    as firebase_storagelibrary_2sa6k9_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomAvatar extends StatefulWidget {
  const CustomAvatar({
    super.key,
    this.width,
    this.height,
    required this.firstName,
    this.lastName,
    this.imageUrl,
    this.size,
    this.isCircular,
    this.enableAnimation,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.backgroundColor,
  });

  final double? width;
  final double? height;
  final String firstName;
  final String? lastName;
  final String? imageUrl;
  final double? size;
  final bool? isCircular;
  final bool? enableAnimation;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final double? fontSize;
  final int? fontWeight;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  // ── Color Palette ────────────────────────────────────────
  static const List<Color> _palette = [
    Color(0xFF4A90D9), // Blue
    Color(0xFF50B86C), // Green
    Color(0xFFE85D75), // Rose
    Color(0xFFF5A623), // Amber
    Color(0xFF9B59B6), // Purple
    Color(0xFF1ABC9C), // Teal
    Color(0xFFE67E22), // Orange
    Color(0xFF3498DB), // Sky Blue
    Color(0xFFE74C3C), // Red
    Color(0xFF2ECC71), // Emerald
    Color(0xFF8E44AD), // Deep Purple
    Color(0xFFF39C12), // Sunflower
    Color(0xFF16A085), // Dark Teal
    Color(0xFFD35400), // Pumpkin
    Color(0xFF2980B9), // Strong Blue
    Color(0xFFC0392B), // Dark Red
  ];

  // ── Helper Methods ───────────────────────────────────────

  String _getInitials() {
    final first = widget.firstName.trim();
    final last = (widget.lastName ?? '').trim();

    if (first.isEmpty && last.isEmpty) return '?';
    if (first.isEmpty) return last[0].toUpperCase();
    if (last.isEmpty) return first[0].toUpperCase();

    return '${first[0]}${last[0]}'.toUpperCase();
  }

  Color _getColorForName() {
    final combined =
        '${widget.firstName.trim()} ${(widget.lastName ?? '').trim()}'.trim();
    if (combined.isEmpty) return _palette[0];
    int hash = 0;
    for (int i = 0; i < combined.length; i++) {
      hash = combined.codeUnitAt(i) + ((hash << 5) - hash);
    }
    return _palette[hash.abs() % _palette.length];
  }

  bool get _hasImage =>
      widget.imageUrl != null && widget.imageUrl!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final double avatarSize = widget.size ?? 48;
    final bool circular = widget.isCircular ?? true;
    final double radius =
        circular ? avatarSize / 2 : (widget.borderRadius ?? 12);
    final double bWidth = widget.borderWidth ?? 0;
    final Color bColor = widget.borderColor ?? Colors.transparent;
    final Color bgColor = widget.backgroundColor ?? _getColorForName();
    final Color fgColor = widget.textColor ?? Colors.white;
    final double fSize = widget.fontSize ?? (avatarSize * 0.38);
    final FontWeight fWeight =
        FontWeight.values[(widget.fontWeight ?? 6).clamp(0, 8)];
    final String initials = _getInitials();
    final bool animate = widget.enableAnimation ?? false;

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        border: bWidth > 0 ? Border.all(color: bColor, width: bWidth) : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: _hasImage
          ? Image.network(
              widget.imageUrl!,
              width: avatarSize,
              height: avatarSize,
              fit: BoxFit.cover,
              frameBuilder: animate
                  ? (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) return child;
                      return AnimatedOpacity(
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        child: child,
                      );
                    }
                  : null,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: fgColor,
                      fontSize: fSize,
                      fontWeight: fWeight,
                      letterSpacing: 0.5,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            )
          : Center(
              child: Text(
                initials,
                style: TextStyle(
                  color: fgColor,
                  fontSize: fSize,
                  fontWeight: fWeight,
                  letterSpacing: 0.5,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}

// boilerplate code using the green button on the right!
