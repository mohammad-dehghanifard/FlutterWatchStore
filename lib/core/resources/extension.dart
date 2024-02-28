import 'package:flutter/cupertino.dart';

extension SizedBoxExtension on double{
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get height => SizedBox(height: toDouble());
}