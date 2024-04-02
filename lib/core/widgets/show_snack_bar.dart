import 'package:flutter/material.dart';

SnackBar buildSnackBar({required BuildContext context,required String content,SnackType type = SnackType.success}) {
  final theme = Theme.of(context).colorScheme;
  return SnackBar(
    content: Text(content),
    backgroundColor: type == SnackType.error? theme.error : const Color(0xFF00C566),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  );
}

enum SnackType {error,success}